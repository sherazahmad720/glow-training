import 'package:get/get.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/profile_controller.dart';
import 'package:training/models/book_model.dart';
import 'package:training/models/teacher_model.dart';
import 'package:training/models/training_model.dart';
import 'package:training/services/api_services.dart';

class DashboardController extends GetxController {
  final AuthController _authController = Get.find();
  final ProfileController _profileController = Get.put(ProfileController());
  final ApiServices _apiServices = ApiServices();
  /* -------------------------------------------------------------------------- */
  TeacherModel teacherModel = TeacherModel();
  bool loading = false;
  List<TrainingModel> trainingList = [];
  TrainingModel? selectedTraining;
  // List<NoticeboardModel> dashboardNoticeList = [];

  getDashBoard() async {
    try {
      clear();
      loading = true;
      update();
      await _profileController.getProfile();
      teacherModel = _profileController.teacherData;
      List list =
          await _apiServices.getTrainings(_authController.accountId ?? 0);
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
    teacherModel = TeacherModel();
    trainingList.clear();
    update();
  }
}
