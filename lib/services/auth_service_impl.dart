import 'dart:io';

import 'package:awanahala/models/User.dart';
import 'package:awanahala/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServiceImpl extends AuthService {
  @override
  Future<void> signIn(String email, String password) async {
    try {
      final body = jsonEncode({"email": email, "password": password});

      var url = 'http://3.223.72.19/api/user/login';
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      // var jsonResponse = json.decode(response.body);
      // // print(jsonResponse);
      // print(response.body.runtimeType);

      if (response.statusCode == 200) {
        print('user login successfull');

        Get.snackbar(
          "Success",
          response.body,
          icon: Icon(
            Icons.done,
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
        );

        // Future.delayed(Duration(seconds: 15));
        Hive.box('user').put('email', email.toLowerCase().trim());
        Get.toNamed("/canteenSelect");
      } else {
        print('login error');
        Get.snackbar(
          "Login error",
          response.body,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        );
      }
    } on SocketException catch (e) {
      // print(e.message);
      Get.snackbar(
        "Error occured",
        e.toString(),
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      );
    }
  }

  @override
  Future<void> signUp(User user) async {
    print("inside signup method");
    try {
      final body = jsonEncode({
        "email": user.email.toLowerCase().trim(),
        "password": user.passWordHash,
        "username": user.userName,
        "fullName": user.fullName,
        "phoneNumber": user.phoneNumber,
        "nic": user.nic,
        "credits": 0,
      });
      var url = 'http://3.223.72.19/api/user/register';

      // var url = 'http://3.223.72.19/api/user/register';
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);

      var jsonResponse = json.decode(response.body);
      // // print(jsonResponse);
      // print(response.body.runtimeType);

      if (response.statusCode == 200) {
        print('user login successfull');

        Get.snackbar(
          "Success",
          response.body,
          icon: Icon(
            Icons.done,
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
        );

        // Future.delayed(Duration(seconds: 15));
        Get.toNamed("/canteenSelect");
      } else {
        print('login error');
        Get.snackbar(
          "Signup error",
          jsonResponse['message'],
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        );
      }
    } on SocketException catch (e) {
      print(e.message);
      Get.snackbar(
        "Error occured",
        e.toString(),
        icon: Icon(
          Icons.error,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
      );
    }
  }
}
