import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/controller/controller.auth.dart';
import 'package:flutter_application_1/auth/dto/login.dto.dart';
import 'package:flutter_application_1/auth/dto/register.dto.dart';
import 'package:flutter_application_1/config.dart';
import 'package:flutter_application_1/map/screens/map.screen.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class AuthDto {
  AuthController authController = Get.find();
  loginUser({required LoginAuth loginAuth}) async {
    var url = Uri.parse("${Config.baseUrl}api/login");

    var response = await http.post(url, body: {
      "username": loginAuth.phoneNumber,
      'password': loginAuth.password,
      "firebase_messaging_token": Random(10).toString(),
      "device_identification": Random(25).toString(),
    }, headers: {});

    if (response.statusCode == 200) {
      authController.setLoading(false);
      

      Get.off(()=>const MapSample());
    } else {
      print(response.statusCode);
      authController.setLoading(false);
      Get.rawSnackbar(
          message: "Error logging in", backgroundColor: Colors.red);
    }
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  registerUser({required RegisterAuth registerAuth}) async {
    var url = Uri.parse("${Config.baseUrl}api/customers/register");

    var response = await http.post(
      url,
      body: {
        "first_name": registerAuth.fullName,
        "last_name": registerAuth.fullName,
        "business_name": registerAuth.businessName,
        "email": registerAuth.emailAddress,
        "phone": registerAuth.phoneNumber,
        "password": registerAuth.password,
        "password_confirmation": registerAuth.password,
        "used_for": "business",
        "hear_about_us_from": registerAuth.hearFromUs,
      },
    );

    if (response.statusCode == 201) {
      authController.setLoading(false);
      Get.rawSnackbar(message: "Created Sucessfully");

      Get.back();
    } else {
      print(response.statusCode);
      authController.setLoading(false);
      Get.rawSnackbar(message: "Created Sucessfully");
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
