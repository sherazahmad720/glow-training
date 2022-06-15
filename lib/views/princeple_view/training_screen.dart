import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/dashboard_controller.dart';
import 'package:training/controllers/notification_controller.dart';
import 'package:training/controllers/teachers_controller.dart';
import 'package:training/controllers/training_controller.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/notification_card.dart';
import 'package:training/widgets/training_card.dart';

import '../teacher_view/book_screen.dart';

class TrainingScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final TrainingController _trainingController = Get.put(TrainingController());
  final DashboardController _dashboardController =
      Get.put(DashboardController());
  TrainingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _trainingController.getTrainings();
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(
          child: GetBuilder<TrainingController>(builder: (trainingController) {
        return trainingController.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: appbarColor,
                ),
              )
            : Column(
                children: [
                  /* --------------------------------- AppBar --------------------------------- */
                  customAppBar(
                      text: 'Training',
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
                          itemCount: trainingController.trainingList.length,
                          itemBuilder: (context, index) {
                            return TrainingCard(
                              title: trainingController
                                  .trainingList[index].trainingTitle,
                              onTap: () {
                                _dashboardController.selectedTraining =
                                    trainingController.trainingList[index];
                                trainingController.selectedTraining =
                                    trainingController.trainingList[index];
                                Get.to(
                                  () => BookScreen(),
                                );
                              },
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
