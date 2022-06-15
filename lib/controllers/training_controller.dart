import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/teachers_controller.dart';

import '../models/training_model.dart';
import '../services/api_services.dart';
import 'auth_controller.dart';

class TrainingController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final AuthController _authController = Get.find();
  final TeacherController _teacherController = Get.put(TeacherController());
  bool loading = false;
  List<TrainingModel> trainingList = [];
  TrainingModel? selectedTraining;
  // List<NoticeboardModel> dashboardNoticeList = [];

  getTrainings() async {
    try {
      clear();
      loading = true;
      update();
      List list = await _apiServices
          .getTrainings(_teacherController.selectedTeacher.teacherId);
      if (list.isNotEmpty && list[0]['Alert'] == 1) {
        list.forEach((element) {
          trainingList.add(TrainingModel.fromJson(element));
        });
      }
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }

  clear() {
    trainingList.clear();
    update();
  }
}
