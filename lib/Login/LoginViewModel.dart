

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signed/listview/UserList.dart';
import 'package:signed/routes/AppRoutes.dart';

import '../PreferenceUtils/PreferenceUtils.dart';
import 'LoginRepository.dart';
// Create the LoginViewModel class and extend it with ChangeNotifier to enable state management.
class LoginViewModel with ChangeNotifier {

  final LoginRepository userRepository;
  LoginViewModel({required this.userRepository});
  String? _response; // Response from the login API call.
  String? get response => _response; // Getter to access the login response.
  String? _loginError;
  bool _isLoading = false;
  String? get loginError => _loginError;
  bool get isLoading => _isLoading;


  //Future<void> login(Map<dynamic, dynamic> req) async {
  login(BuildContext context , String name, String password, String salt) async {
    _isLoading = true;
    notifyListeners();

    try {
      /*var response = await userRepository.login(name, password, salt);
      // Assuming response is a JSON string, parse it into a map
      var responseData = jsonDecode(response);

      print("getting_Data $responseData");

      if (responseData['Status'] == true) {

        print("getting_loginError_trtue $_loginError");

        PreferenceUtils.setString("messagelogin" , responseData['Message']);
        Navigator.push(context,MaterialPageRoute(builder: (context) => UserList(name: name)));
      } */

      var response = await userRepository.login(name, password, salt).then((value) {
        var res= value["Status"];
        print("getting_Data_ $res");
        if (value["Status"] == "false") {
          _loginError = value['Message'];

        }
        else {
          print("getting_loginError_trtue $_loginError");
          PreferenceUtils.setString("messagelogin" , value['Message']);
          PreferenceUtils.setString("statuslogin" , value['Status'].toString());
          Navigator.push(context,MaterialPageRoute(builder: (context) => UserList(name: name)));
        //  Navigator.pushNamed(context, AppRoutes.UserList);
         // Navigator.pushReplacementNamed(context,  AppRoutes.UserList);
         /* Navigator.pushNamed(
            context,
            AppRoutes.UserList,
          );*/
          _loginError = value['Message'];
          print("getting_loginError $_loginError");
          // Perform actions for successful login
        }

      });
      // Assuming response is a JSON string, parse it into a map


      print("getting_Data $response");

     /* if (responseData['Status'] == true) {

        print("getting_loginError_trtue $_loginError");

        PreferenceUtils.setString("messagelogin" , responseData['Message']);
        Navigator.push(context,MaterialPageRoute(builder: (context) => UserList(name: name)));

    }
      else {

        _loginError = responseData['Message'];
        print("getting_loginError $_loginError");
        // Perform actions for successful login
      }*/
    } catch (e) {
      _loginError = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
