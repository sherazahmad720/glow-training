import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/models/certificate_model.dart';
import 'package:training/models/notification_model.dart';

import '../services/api_services.dart';

class CertificateController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final AuthController authController = Get.find();
  List<CertificateModel> certificateList = [];
  bool loading = false;

  getCertificate() async {
    try {
      certificateList.clear();
      loading = true;
      update();
      List list =
          await _apiServices.getCertificates(authController.accountId ?? 0);
      if (list.isNotEmpty && list[0]['Alert'] == 1) {
        list.forEach((element) {
          certificateList.add(CertificateModel.fromJson(element));
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
    certificateList = [];
    update();
  }
}
