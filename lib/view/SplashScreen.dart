import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:signed/Login/LoginPage.dart';
import 'package:signed/PreferenceUtils/PreferenceUtils.dart';
import 'package:signed/listview/UserList.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppUpdateInfo? _updateInfo;
  String logo = "images/app_logoone.png";
  String branding = "ConnelBlaze";
  String logoText = "Splasha";
  bool isDone = false;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;



  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkForUpdate();
    PackageInfo.fromPlatform().then((value) {
      print("packagenameofapplication"+value.toString()); // Value will be our all details we get from package info package
    });
    Timer(Duration(seconds: 2), () {
      //if(box.read('loginBool') == true) {

      if (PreferenceUtils.getString("statuslogin") == "false") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                UserList(name: "name")
            )
        );
      } else {

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
               LoginPage()
            )
        );
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(child: Text("Splash Screen dummy app\n for provider mvvm" , style: TextStyle(fontSize: 16),)),
      ),
    );
  }
}
