import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signed/PreferenceUtils/CustomAppBar.dart';
import 'package:signed/PreferenceUtils/PreferenceUtils.dart';

import '../PreferenceUtils/InternetChecker.dart';
import '../practise/practisestate.dart';
import '../view/ScreenThreegetvalue.dart';
import 'UserViewModel.dart';

class UserList extends StatefulWidget {
  String name;

  UserList({required this.name, Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var getmessage;

  @override
  void initState() {


    super.initState();

    var getname = widget.name;
    print("getname" + getname);

    // Fetch user data when the state object is inserted into the tree.
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    userViewModel.fetchUsers();

    getdatasharedpreference();
  }

  void getdatasharedpreference() async {
    getmessage = PreferenceUtils.getString("messagelogin");
    print("datashared" + getmessage.toString());
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    ElevatedButton(
                      child: Text('Yes, exit'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              });
          return value == true;
        },
        child: Scaffold(
          appBar: CustomAppBar(showBackButton: true,title: getmessage.toString(),actions: [],

          ),
          body: userViewModel.loading ? Center(child: CircularProgressIndicator(),) : userViewModel.errorMessage.isNotEmpty
                  ? Center(
                      child: Text(userViewModel.errorMessage),
                    )
                  :

              Container(
                child: ListView.builder(
                            itemCount: userViewModel.users.length,
                            itemBuilder: (context, index) {
                              final user = userViewModel.users[index];
                              // Display a list of users with their name, email, and ID.
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screenthreegetvalue()));
                                },
                                child: ListTile(
                                  title: Text(user.name),
                                  subtitle: Text(user.email),
                                  leading: CircleAvatar(
                                    child: Text(user.id.toString()),
                                  ),
                                ),
                              );
                            },
                          ),
                      ),  

        ));
  }
}
