import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/dashboard_controller.dart';
import 'package:training/views/teacher_view/book_screen.dart';
import 'package:training/views/teacher_view/menu_screen.dart';
import 'package:training/widgets/dashboard_appBar.dart';

import '../../widgets/training_card.dart';

class DashboardScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    _dashboardController.getDashBoard();

    // HomeworkController homeworkController = Get.put(HomeworkController());
    // NoticeController noticeController = Get.put(NoticeController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<DashboardController>(builder: (dashboardController) {
          return dashboardController.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: appbarColor,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //     /* --------------------------------- AppBar --------------------------------- */
                    Container(
                      color: bodyBackgroundColor,
                      height: 116.h,
                      child: dashboardAppBar(
                        bgImage: 'assets/bg_appbar.png',
                        icon: Icons.menu,
                        iconOnTap: () {
                          Get.to(() => MenuScreen(),
                              transition: Transition.upToDown);
                        },
                        profilePic:
                            'http://tcp.east.education/images/tcp_logo.jpg',
                        name: dashboardController.teacherModel.teacherName,
                        className: dashboardController.teacherModel.designation,
                        // profilePic: dashboardController.studentPicturePath !=
                        //         null
                        //     ? "${authController.siteUrl}${dashboardController.studentPicturePath}"
                        //     : '${authController.siteUrl}Glow-resources/fake_user_pic.png',
                        profilePicOnTap: () {},
                      ),
                    ),
                    size20,
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: customText(
                        text: 'Select Training',
                        color: black,
                        size: 20.sp,
                        fw: FontWeight.bold,
                      ),
                    ),

                    //     /* ---------------------------------- Body ---------------------------------- */
                    Expanded(
                      child: Container(
                        // color: new_darkBlue,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(15),
                            itemCount: dashboardController.trainingList.length,
                            itemBuilder: (context, index) {
                              return TrainingCard(
                                title: dashboardController
                                    .trainingList[index].trainingTitle,
                                onTap: () {
                                  dashboardController.selectedTraining =
                                      dashboardController.trainingList[index];
                                  Get.to(
                                    () => BookScreen(),
                                  );
                                },
                              );
                            }),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
