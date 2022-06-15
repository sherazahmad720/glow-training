import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:training/services/api_services.dart';
import 'package:training/views/princeple_view/principle_dashboard_screen.dart';
import '../views/teacher_view/dashboard_screen.dart';

class AuthController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final box = GetStorage();

  String userName = '';
  String password = '';
  int? accountId;
  String accountType = '';
  bool loading = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String? passwordValidator(value) {
    if (value == '') {
      return 'Please enter password';
    } else {
      return null;
    }
  }

  String? userNameValidator(value) {
    if (value == '') {
      return 'Please enter username';
    } else {
      return null;
    }
  }

  login() async {
    // userName = 'S-1-APSS-3064';
    // password = 'S-1-APSS-3064123';
    if (loginFormKey.currentState!.validate()) {
      loading = true;
      update();
      loginFormKey.currentState!.save();
      var userData = await _apiServices.login(userName, password);
      if (userData['Alert'] == 1) {
        accountId = userData['ReturnId'];
        accountType = userData['AccountType'];
        box.write('accountId', '$accountId');
        box.write('accountType', '$accountType');
        if (accountType == 'Teacher') {
          Get.off(() => DashboardScreen());
        } else {
          Get.off(() => PrincipleDashboardScreen());
        }
      } else {
        Get.snackbar('Error', userData['Message'],
            backgroundColor: Colors.red.withOpacity(0.4),
            snackPosition: SnackPosition.TOP);
      }
      loading = false;
      update();
    }
  }

  logout() {
    box.write('accountId', '');
    box.write('accountType', '');
  }

  getUser() {}

  saveUser(studentId) {}
}
