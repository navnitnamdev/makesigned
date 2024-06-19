import 'package:flutter/material.dart';
import 'package:signed/PreferenceUtils/PreferenceUtils.dart';

import '../Login/LoginPage.dart';


class Screenthreegetvalue extends StatefulWidget {
  const Screenthreegetvalue({super.key});

  @override
  State<Screenthreegetvalue> createState() => _ScreenthreegetvalueState();
}

class _ScreenthreegetvalueState extends State<Screenthreegetvalue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Value Screen"),
        actions: [
          InkWell(
              onTap: (){

                showAlertDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.logout),
              ))
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(PreferenceUtils.getString("messagelogin").toString()),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget NoButton = TextButton(
      child: Text("NO"),
      onPressed: () {
       Navigator.pop(context);
      },
    );
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {

        PreferenceUtils.remove("statuslogin");
        PreferenceUtils.clear();
        Navigator.pop(context);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginPage()
            )
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert!"),
      content: Text("Are you sure want to logout?"),
      actions: [
        NoButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
