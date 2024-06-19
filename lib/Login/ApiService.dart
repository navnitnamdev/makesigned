import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseurl = "https://ejalshakti.gov.in/krcpwa/api/";
  late Dio _dio; // Dio instance to perform HTTP requests.

  // ApiService({required Dio dio}) : _dio = dio;
  ApiService({required Dio dio}) {
    _dio = Dio(BaseOptions(
      responseType: ResponseType.json,
    ))
      ..interceptors.addAll([
        //LoggerInterceptor(), //custom logger interceptor.
      ]);
  }



/*
/// this is for dio
   Future loginUser(String name , String password ,  String txtsalt ) async {
    try {
      final dio = Dio();

      final response = await dio.post(
        'https://ejalshakti.gov.in/krcpwa/api/JJM_Mobile/Login',
        data: jsonEncode({
          'LoginId': name,
          'Password': password,
          'txtSaltedHash': txtsalt,
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {

        var responseBody = jsonEncode(response.data);
        print('Response Body: $responseBody');
        // If 'error' key doesn't exist, return a generic error message
        return responseBody;
      } else {
        return 'Failed to login';
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null &&
            e.response!.data != null &&
            e.response!.data['error'] != null) {
          final errorMessage = e.response!.data['error'];
          print('Error Message: $errorMessage');
          return errorMessage;
        }
      }
      // Handle other errors or exceptions
      print('Error: $e');
      return null;
    }
  }
*/
  // this is for http
   Future loginUser(

      String userid,
      String password,
      String randomsalt,
      ) async {
   /* showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              //CircularProgressIndicator()
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset("images/loading.gif")),


            ],
          );
        });*/

    //print("Firebase_token_sending:" + box.read("firebase_token").toString());
    var response = await http.post(
      Uri.parse('${baseurl}' + "JJM_Mobile/Login"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "LoginId": userid,
        //"LoginId": "fu_admin",
        "Password": password,
        //  "Password": "nic@123",txtSaltedHash
        "txtSaltedHash": randomsalt

      }),
    );
 // Navigator.pop(context);
    print("LoginId  > " + password);
    print("password > " + password);
    print("txtSaltedHash > " + randomsalt);
    if (response.statusCode == 200) {
      print("response_Login: " + response.body);
      var responsede = jsonDecode(response.body);
      print("randomsalt_0"+randomsalt);
      //   print("response_login" +responsede);

    }
    return jsonDecode(response.body);
  }
// this is type of dio api
  /* Future StoragestructurePendingandApprovedAPI(String villageid, String stateid,
      String userid, String status, String token) async {
    setState(() {
      _loading = true;
    });*/
  Future<List<dynamic>> getUsers() async {
    try {
      final dio = Dio();
      // Make a GET request to the API endpoint to fetch user data.
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users');

      // Check if the response status code is 200 (OK).
      if (response.statusCode == 200) {
        return response.data; // If successful, return the response data (List of dynamic).
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }

  // this is type of http api
/*

 Future StoragestructurePendingandApprovedAPI(String villageid, String stateid,
      String userid, String status, String token) async {
    setState(() {
      _loading = true;
    });


  Future<List<dynamic>> getUsers() async {
    try {
      final dio = Dio();
      // Make a GET request to the API endpoint to fetch user data.
      // final response = await _dio.get('https://jsonplaceholder.typicode.com/users');
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      // Check if the response status code is 200 (OK).
      if (response.statusCode == 200) {
        //return response.data; // If successful, return the response data (List of dynamic).
        return jsonDecode(response.body); // If successful, return the response data (List of dynamic).
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }
*/

}