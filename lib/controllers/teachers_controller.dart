import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/models/teacher_model.dart';
import 'package:training/services/api_services.dart';

class TeacherController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final AuthController _authController = Get.find();
  bool loading = false;

  List<TeacherModel> teacherList = [];
  TeacherModel selectedTeacher = TeacherModel();

  getTeacherList() async {
    try {
      loading = true;
      update();
      var data =
          await _apiServices.getTeacherList(_authController.accountId ?? 0);
      data.forEach((element) {
        teacherList.add(TeacherModel.fromJson(element));
      });
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }
}
