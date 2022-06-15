import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/notification_controller.dart';
import 'package:training/controllers/teachers_controller.dart';
import 'package:training/views/princeple_view/training_screen.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/notification_card.dart';
import 'package:training/widgets/training_card.dart';

class TeachersScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final TeacherController _teacherController = Get.put(TeacherController());

  TeachersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _teacherController.getTeacherList();

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(
          child: GetBuilder<TeacherController>(builder: (teacherController) {
        return teacherController.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: appbarColor,
                ),
              )
            : Column(
                children: [
                  /* --------------------------------- AppBar --------------------------------- */
                  customAppBar(
                      text: 'Teachers',
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
                          itemCount: teacherController.teacherList.length,
                          itemBuilder: (context, index) {
                            return TrainingCard(
                              onTap: () {
                                teacherController.selectedTeacher =
                                    teacherController.teacherList[index];
                                Get.to(() => TrainingScreen());
                              },
                              title: teacherController
                                  .teacherList[index].teacherName,
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
