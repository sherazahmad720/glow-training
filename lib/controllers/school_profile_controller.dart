import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:training/controllers/auth_controller.dart';
import 'package:training/models/school_profile_model.dart';
import 'package:training/models/teacher_model.dart';
import 'package:training/services/api_services.dart';

class SchoolProfileController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  SchoolProfileModel schoolProfileModel = SchoolProfileModel();
  bool loading = false;

  getSchoolProfile() async {
    try {
      AuthController authController = Get.find();
      loading = true;
      clear();
      var userData =
          await _apiServices.getSchoolProfile(authController.accountId ?? 0);
      if (userData['Alert'] == 1) {
        schoolProfileModel = SchoolProfileModel.fromJson(userData);
      }
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }

  clear() {
    schoolProfileModel = SchoolProfileModel();
  }
}
