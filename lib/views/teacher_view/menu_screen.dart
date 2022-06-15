import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:training/constants.dart';
import 'package:training/services/api_services.dart';
import 'package:training/views/teacher_view/certificate_list_screen.dart';
import 'package:training/views/common_view/login_page.dart';
import 'package:training/views/teacher_view/notification_screen.dart';
import 'package:training/views/teacher_view/profile_screen.dart';
import 'package:training/widgets/certificate_card.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../widgets/circle_image_named_widget.dart';
import '../../widgets/menu_header_widget.dart';

class MenuScreen extends StatelessWidget {
  final ApiServices _apiServices = ApiServices();
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbarColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            size15,
            /* --------------------------------- AppBar --------------------------------- */
            GetBuilder<DashboardController>(builder: (dashboardController) {
              return menuHeaderWidget(
                profilePic: 'http://tcp.east.education/images/tcp_logo.jpg',
                nameColor: black,
                // profileOnTap: () => Get.to(() => ProfileScreen()),
                name: dashboardController.teacherModel.teacherName,
                className: dashboardController.teacherModel.designation,
                buttonOntap: () {
                  Get.back();
                },
              );
            }),
            size60,
            /* ---------------------------------- Body ---------------------------------- */
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    circleImageNamedWidget(
                        icon: Icons.wallet_membership_outlined,
                        text: 'Trainings',
                        onTap: () => Get.back()),
                  ],
                ),
                Column(
                  children: [
                    circleImageNamedWidget(
                        text: 'Certificates',
                        icon: Icons.document_scanner,
                        onTap: () {
                          Get.off(() => CertificateListScreen());
                        }),
                    size45,
                  ],
                ),
                Column(
                  children: [
                    circleImageNamedWidget(
                      icon: Icons.person_outline,
                      onTap: () {
                        Get.off(() => ProfileScreen());
                      },
                      text: 'Profile',
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            customText(
                text: 'Logout',
                size: 20.sp,
                fw: FontWeight.bold,
                color: Colors.red,
                onTap: () {
                  authController.logout();

                  Get.offAll(() => const LoginPage(), opaque: true);
                }),
            size40
          ],
        ),
      ),
    );
  }
}
