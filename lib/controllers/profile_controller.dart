import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:training/controllers/auth_controller.dart';
import 'package:training/models/teacher_model.dart';
import 'package:training/services/api_services.dart';

class ProfileController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  TeacherModel teacherData = TeacherModel();
  bool loading = false;
  getProfile() async {
    try {
      AuthController authController = Get.find();
      loading = true;
      clear();
      var userData =
          await _apiServices.getTeacherProfile(authController.accountId ?? 0);
      if (userData['Alert'] == 1) {
        teacherData = TeacherModel.fromJson(userData);
      }
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }

  clear() {
    teacherData = TeacherModel();
  }
}
