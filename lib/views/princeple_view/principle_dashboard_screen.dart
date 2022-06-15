import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/course_controller.dart';
import 'package:training/controllers/dashboard_controller.dart';
import 'package:training/controllers/school_profile_controller.dart';
import 'package:training/views/princeple_view/course_screen.dart';
import 'package:training/views/princeple_view/teachers_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:training/services/api_services.dart';
import 'package:training/views/princeple_view/principle_menu_screen.dart';
import 'package:training/views/teacher_view/book_screen.dart';
import 'package:training/views/teacher_view/menu_screen.dart';
import 'package:training/widgets/custom_widgets.dart.dart';
import 'package:training/widgets/dashboard_appBar.dart';

import '../../controllers/school_dashboard_controller copy.dart';
import '../../widgets/training_card.dart';

class PrincipleDashboardScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final SchoolDashboardController _dashboardController =
      Get.put(SchoolDashboardController());
  final CourseController _courseController = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    _dashboardController.getDashBoard();

    // HomeworkController homeworkController = Get.put(HomeworkController());
    // NoticeController noticeController = Get.put(NoticeController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SchoolDashboardController>(
            builder: (dashboardController) {
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
                          Get.to(() => PrincipleMenuScreen(),
                              transition: Transition.upToDown);
                        },
                        profilePic: ApiServices().getFilePath(
                            dashboardController.schoolProfileModel.logoPath),
                        name: dashboardController.schoolProfileModel.schoolName,
                        className:
                            dashboardController.schoolProfileModel.address,
                        // profilePic: dashboardController.studentPicturePath !=
                        //         null
                        //     ? "${authController.siteUrl}${dashboardController.studentPicturePath}"
                        //     : '${authController.siteUrl}Glow-resources/fake_user_pic.png',
                        profilePicOnTap: () {},
                      ),
                    ),
                    size20,
                    // CarouselSlider(
                    //   options: CarouselOptions(
                    //       viewportFraction: 1,
                    //       autoPlay: true,
                    //       autoPlayInterval: Duration(seconds: 5),
                    //       autoPlayAnimationDuration:
                    //           Duration(milliseconds: 500)),
                    //   items: dashboardController
                    //       .schoolDashboardModel.glowSimsAdDs
                    //       ?.map((ad) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return InkWell(
                    //           onTap: () async {
                    //             if (!await launchUrl(Uri.parse(ad.clickUrl)))
                    //               throw 'Could not launch ';
                    //           },
                    //           child: Container(
                    //             margin: EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8),
                    //               image: DecorationImage(
                    //                   image: NetworkImage(
                    //                       ApiServices().getFilePath(
                    //                     ad.adUrl,
                    //                   )),
                    //                   fit: BoxFit.fitWidth),
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                    // size5,
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: customButton('Teacher Progress',
                          backgroundColor: appbarColor, onTap: () {
                        Get.to(() => TeachersScreen());
                      }),
                    ),
                    size10,
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: customText(
                        text: 'Resources',
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
                            itemCount: dashboardController
                                .schoolDashboardModel.courseCategory?.length,
                            itemBuilder: (context, index) {
                              return TrainingCard(
                                title: dashboardController
                                        .schoolDashboardModel
                                        .courseCategory?[index]
                                        .courseCategoryTitle ??
                                    '',
                                onTap: () {
                                  _courseController.selectedCourseCategory =
                                      dashboardController.schoolDashboardModel
                                          .courseCategory![index];
                                  Get.to(() => CourseScreen());
                                },
                              );
                            }),
                      ),
                    ),
                    // size20,
                    // CarouselSlider(
                    //   options: CarouselOptions(
                    //       viewportFraction: 1,
                    //       autoPlay: true,
                    //       autoPlayInterval: Duration(seconds: 5),
                    //       autoPlayAnimationDuration:
                    //           Duration(milliseconds: 500)),
                    //   items: dashboardController
                    //       .schoolDashboardModel.glowSimsAdDs
                    //       ?.map((ad) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return InkWell(
                    //           onTap: () async {
                    //             if (!await launchUrl(Uri.parse(ad.clickUrl)))
                    //               throw 'Could not launch ';
                    //           },
                    //           child: Container(
                    //             margin: EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8),
                    //               image: DecorationImage(
                    //                   image: NetworkImage(
                    //                       ApiServices().getFilePath(
                    //                     ad.adUrl,
                    //                   )),
                    //                   fit: BoxFit.fitWidth),
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                  ],
                );
        }),
      ),
    );
  }
}
