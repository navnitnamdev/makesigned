import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/widgets/pretty_capsule_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_fuzzy_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_shadow_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_skew_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_slide_icon_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_slide_up_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import 'package:provider/provider.dart';
import 'package:signed/SkeletonTextExample.dart';
import 'package:signed/listview/UserList.dart';
import '../PaginationExample.dart';
import '../PreferenceUtils/CustomElevationButton.dart';
import '../PreferenceUtils/InternetChecker.dart';
import '../ScreenLayoutbuilder.dart';
import 'CommonTextField.dart';
import 'LoginViewModel.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var hashedPassword;
  int RandomNumbersalt = 0;
  var HASHpassword;
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  int RandomNumber = 0;
  int RandomNumber1 = 0;
  int addcaptcha = 0;

  var random;

  Color buttonColor = Colors.red;
  @override
  Widget build(BuildContext context) {
   // final viewModel = Provider.of<LoginViewModel>(context);

final viewModel = Provider.of<LoginViewModel>(context);



    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Show CircularProgressIndicator while loading
                // Show response message if login is successful
                if (viewModel.response != null)
                  Text(
                    viewModel.response!.toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                const SizedBox(height: 16),
                // Username text field
                CommonTextField(
                  controller: name,
                  hintText: 'Enter your username',
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Handle username changes
                  },
                ),
                SizedBox(height: 20),
                // Password text field
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter password",
                      hintStyle: TextStyle(fontSize: 16),
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
            
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
            
                    controller: password,
                    onChanged: (password) {
                      var bytes = utf8.encode(password);
                      var digest = sha512.convert(bytes);
                      hashedPassword = digest.toString().toUpperCase();
                      HASHpassword = hashedPassword + RandomNumbersalt.toString();
                      print("SHA-512 Hash: $HASHpassword");
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 5),
                        margin:
                        const EdgeInsets.only(left: 0, right: 50),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4)),
                          margin: const EdgeInsets.only(
                              top: 20, bottom: 20),
                          child: Center(
                            child: Text(
                              '$RandomNumber' +
                                  " + " +
                                  '$RandomNumber1 =  ?',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                              color: Colors.black,
                              onPressed: () {
            
                                  random = generateRandomString(6);
            
                              },
                              icon: Center(
                                  child: Icon(Icons.refresh,
            
            
                                  ))),
                        )),
                  ],
                ),
                Container(height:0),
                // Login button

                CustomElevationButton(
                  child: viewModel.isLoading==true ? CircularProgressIndicator(color: Colors.white,) :  Text('Login'),

                  elevation: 8.0, // custom elevation
                  backgroundColor: buttonColor, // Color based on API call success

                  onPressed: () async{
                    bool isConnected = await InternetChecker.isConnected();
                    if (isConnected) {
                      print('Connected to the internet');
                      // Construct login request with the entered username and password
                      Map<dynamic, dynamic> req = {
                        "email": name.text,
                        "password": password.text,
                      };
                      // Call the login method in the view model with the request
                      viewModel.login(context,  name.text, password.text, RandomNumbersalt.toString());
                        //viewModel.login(req).then((value) {

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserList(name  : name.text)));


                     // });
                    } else {
                      print('Not connected to the internet');
                    }
                                     },
                ),
                PrettyShadowButton(
                  label: "Skalaton text",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SkeletonTextExample()));
                  },
                  icon: Icons.arrow_forward,
                  shadowColor: Colors.yellow,
                ),
                PrettyShadowButton(
                  label: "pagination",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaginationExample ()));
                  },
                  icon: Icons.arrow_forward,
                  shadowColor: Colors.yellow,
                ),    PrettyShadowButton(
                  label: "Screen LayoutBuilder",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenLayoutBuilder ()));
                  },
                  icon: Icons.arrow_forward,
                  shadowColor: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String generateRandomString(int len) {
    int max = 15;
    RandomNumber = Random().nextInt(max);
    RandomNumber1 = Random().nextInt(max);
    addcaptcha = RandomNumber + RandomNumber1;
    RandomNumbersalt = Random().nextInt(max);
    print("randomnumber" + RandomNumbersalt.toString());
    print("randomnumber" + addcaptcha.toString());

    return addcaptcha.toString();
  }

}
