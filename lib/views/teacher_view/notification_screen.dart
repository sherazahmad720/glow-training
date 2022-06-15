import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/notification_controller.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final NotificationController _notificationController =
      Get.put(NotificationController());

  NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _notificationController.getNotification();

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(child:
          GetBuilder<NotificationController>(builder: (notificationController) {
        return notificationController.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: appbarColor,
                ),
              )
            : Column(
                children: [
                  /* --------------------------------- AppBar --------------------------------- */
                  customAppBar(
                      text: 'Notifications',
                      icon: Icons.arrow_back,
                      onTap: () => Get.back()),
                  /* ---------------------------------- Body ---------------------------------- */
                  Expanded(
                      child: Container(
                    width: Get.width,
                    color: appbarColor,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 20.r),
                        decoration: BoxDecoration(
                          color: bodyBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.r),
                          ),
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 30),
                          itemCount:
                              notificationController.notificationList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                if (index == 0 ||
                                    notificationController
                                            .notificationList[index].date !=
                                        notificationController
                                            .notificationList[index - 1].date)
                                  customText(
                                    text: DateFormat('EEEE dd MMM, yyyy')
                                        .format(notificationController
                                                .notificationList[index].date ??
                                            DateTime.now()),
                                    color: grey,
                                    size: 14,
                                  ),
                                size5,
                                NotificationCard(
                                  notificationModel: notificationController
                                      .notificationList[index],
                                ),
                                size10,
                              ],
                            );
                          },
                        )),
                    // ),
                  ))
                ],
              );
      })),
    );
  }
}
