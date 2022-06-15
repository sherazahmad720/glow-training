import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:training/constants.dart';
import 'package:training/services/api_services.dart';
import 'package:training/views/princeple_view/school_profile_screen.dart';
import 'package:training/views/teacher_view/certificate_list_screen.dart';
import 'package:training/views/common_view/login_page.dart';
import 'package:training/views/teacher_view/notification_screen.dart';
import 'package:training/views/teacher_view/profile_screen.dart';
import 'package:training/widgets/certificate_card.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/school_dashboard_controller copy.dart';
import '../../widgets/circle_image_named_widget.dart';
import '../../widgets/menu_header_widget.dart';

class PrincipleMenuScreen extends StatelessWidget {
  final ApiServices _apiServices = ApiServices();
  final AuthController authController = Get.put(AuthController());
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
            GetBuilder<SchoolDashboardController>(
                builder: (dashboardController) {
              return menuHeaderWidget(
                profilePic: _apiServices.getFilePath(
                    (dashboardController.schoolProfileModel.logoPath)),
                nameColor: black,
                // profileOnTap: () => Get.to(() => ProfileScreen()),
                name: dashboardController.schoolProfileModel.schoolName,

                className: dashboardController.schoolProfileModel.address,
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
                      icon: Icons.person_outline,
                      onTap: () {
                        Get.off(() => SchoolProfileScreen());
                      },
                      text: 'Profile',
                    ),
                  ],
                ),
                Column(
                  children: [
                    circleImageNamedWidget(
                        text: 'Notifications',
                        icon: Icons.notifications_outlined,
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        }),
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
