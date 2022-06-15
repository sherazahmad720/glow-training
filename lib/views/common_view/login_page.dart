import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';

import '../../widgets/custom_widgets.dart.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg_splash.jpg"),
                      fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(35))),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/logo.png')),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Container(
                height: Get.height / 2,
                decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(35))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (authController) {
                        return Form(
                          key: authController.loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              size100,
                              // Row(
                              //   children: [
                              //     customText(text: 'Username'),
                              //   ],
                              // ),
                              CustomTextField(
                                  label: 'Username',
                                  validator: authController.userNameValidator,
                                  onSave: (val) =>
                                      authController.userName = val),
                              // size40,
                              // customText(text: 'Password'),
                              size20,
                              CustomTextField(
                                  isPassword: true,
                                  label: 'Password',
                                  validator: authController.passwordValidator,
                                  onSave: (val) =>
                                      authController.password = val),
                              size40,
                              authController.loading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: appbarColor,
                                    ))
                                  : customButton('Sign In',
                                      backgroundColor: appbarColor, onTap: () {
                                      authController.login();
                                    })
                            ],
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
