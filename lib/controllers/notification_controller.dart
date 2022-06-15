import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/models/notification_model.dart';

import '../services/api_services.dart';

class NotificationController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final AuthController authController = Get.find();
  List<NotificationModel> notificationList = [];
  bool loading = false;

  getNotification() async {
    try {
      notificationList.clear();
      loading = true;
      update();
      List list =
          await _apiServices.getNotification(authController.accountId ?? 0);
      if (list.isNotEmpty && list[0]['Alert'] == 1) {
        list.forEach((element) {
          NotificationModel notificationModel =
              NotificationModel.fromJson(element);

          notificationList.add(notificationModel);
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
    notificationList = [];
    update();
  }
}
