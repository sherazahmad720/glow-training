import 'package:get/get.dart';
import 'package:training/models/school_dashboard_model.dart';
import 'package:training/models/school_profile_model.dart';
import 'package:training/services/api_services.dart';

import 'school_profile_controller.dart';

class SchoolDashboardController extends GetxController {
  final SchoolProfileController _schoolProfileController =
      Get.put(SchoolProfileController());
  final ApiServices _apiServices = ApiServices();
  /* -------------------------------------------------------------------------- */
  SchoolProfileModel schoolProfileModel = SchoolProfileModel();
  SchoolDashboardModel schoolDashboardModel = SchoolDashboardModel();
  bool loading = false;

  // List<NoticeboardModel> dashboardNoticeList = [];

  getDashBoard() async {
    try {
      clear();
      loading = true;
      update();
      await _schoolProfileController.getSchoolProfile();
      schoolProfileModel = _schoolProfileController.schoolProfileModel;
      var data = await _apiServices.getSchoolDashboard();
      if (data['Alert'] == 1) {
        schoolDashboardModel = SchoolDashboardModel.fromJson(data);
      }
      // list.forEach((element) {
      //   trainingList.add(TrainingModel.fromJson(element));
      // });
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }

  clear() {
    schoolProfileModel = SchoolProfileModel();
    schoolDashboardModel = SchoolDashboardModel();
    update();
  }
}
