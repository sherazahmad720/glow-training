import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:training/views/teacher_view/dashboard_screen.dart';
import 'package:training/views/common_view/login_page.dart';

import '../../controllers/auth_controller.dart';
import '../princeple_view/principle_dashboard_screen.dart';

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());
  final box = GetStorage();

  goToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    String userId = box.read('accountId') ?? '';

    if (userId != '') {
      authController.accountId = int.tryParse(userId);
      authController.accountType = box.read('accountType') ?? '';
      if (authController.accountType == 'Teacher') {
        Get.off(() => DashboardScreen());
      } else {
        Get.off(() => PrincipleDashboardScreen());
      }
    } else {
      Get.off(() => const LoginPage());
    }
  }

  @override
  void initState() {
    goToLoginScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            // decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/bg_splash.jpg"),
            //         fit: BoxFit.fitWidth)),
            ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 700),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/glowsims_logo.png"))),
            ),
          ),
        ),
      ]),
    );
  }
}
