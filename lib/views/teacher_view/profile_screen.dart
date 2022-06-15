import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/services/api_services.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/circle_avatar_widget.dart';
import '../../widgets/row_textfield_widget.dart';

class ProfileScreen extends StatelessWidget {
  final ApiServices _apiServices = ApiServices();
  final AuthController authController = Get.find();
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    _profileController.getProfile();
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (profileController) {
        return profileController.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: appbarColor,
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                      leading: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      backgroundColor: appbarColor,
                      title: const Text(
                        'Profile',
                        style: TextStyle(color: Colors.black),
                      ),
                      pinned: true,
                      expandedHeight: Get.height * 0.45,
                      flexibleSpace: FlexibleSpaceBar(
                          background: profileCard(
                              'http://tcp.east.education/images/tcp_logo.jpg',
                              profileController.teacherData.teacherName,
                              profileController.teacherData.status))),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      color: appbarColor,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.r),
                            ),
                            color: bodyBackgroundColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              size15,
                              rowTextFieldWidget(
                                text: 'School Name',
                                numbers:
                                    profileController.teacherData.schoolName,
                              ),
                              Divider(
                                thickness: 1.r,
                              ),
                              rowTextFieldWidget(
                                text: 'Mobile No',
                                numbers:
                                    profileController.teacherData.mobileForSms,
                              ),
                              Divider(
                                thickness: 1.r,
                              ),
                              rowTextFieldWidget(
                                text: 'Gender',
                                numbers: profileController.teacherData.gender,
                              ),
                              Divider(
                                thickness: 1.r,
                              ),
                              rowTextFieldWidget(
                                text: 'Designation',
                                numbers:
                                    profileController.teacherData.designation,
                              ),
                              Divider(
                                thickness: 1.r,
                              ),
                              rowTextFieldWidget(
                                text: 'Education',
                                numbers:
                                    profileController.teacherData.education,
                              ),
                              Divider(
                                thickness: 1.r,
                              ),
                              rowTextFieldWidget(
                                text: 'Experience',
                                numbers:
                                    profileController.teacherData.experience,
                              ),

                              Divider(
                                thickness: 1.r,
                              ),

                              size150,

                              // GetBuilder(builder: (profileController) {
                              //   //  for (var i = 0; i < 30; i++)
                              //   return Column(
                              //     children: [
                              //       rowTextFieldWidget(text: 'Position in class', numbers: '12'),
                              //       Divider(
                              //         thickness: 1.r,
                              //       ),
                              //     ],
                              //   );
                              // }),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]))
                ],
              );
      }),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Container(
      //           height: Get.height * 0.45,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.only(
      //               bottomLeft: Radius.circular(25.r),
      //             ),
      //             color: blue,
      //             image: const DecorationImage(
      //                 image: AssetImage("assets/bg_star.png"),
      //                 fit: BoxFit.cover),
      //           ),
      //           child: Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 // size15,
      //                 Row(
      //                   children: [
      //                     IconButton(
      //                         onPressed: () => Get.back(),
      //                         icon: Icon(
      //                           Icons.arrow_back,
      //                           color: white,
      //                         )),
      //                     customText(
      //                         text: 'Profile',
      //                         color: white,
      //                          ,
      //                         size: 20.sp)
      //                   ],
      //                 ),
      //                 Column(
      //                   children: [
      //                     circleAvatarWidget(
      //                         image: 'assets/profilepic.png', radius: 60.r),
      //                     size25,
      //                     customText(
      //                         text: 'Yogita Shaje',
      //                         size: 20.sp,
      //                         color: white,
      //                          ),
      //                     size5,
      //                     customText(
      //                       text: 'Class VII B',
      //                       size: 14.sp,
      //                       color: lightgrey,
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           color: blue,
      //           child: Container(
      //             padding: EdgeInsets.all(20.r),
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.only(
      //                 topRight: Radius.circular(30.r),
      //               ),
      //             ),
      //             child: Column(
      //               // mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 size30,
      //                 rowTextFieldWidget(text: 'Roll Number', numbers: '0175'),
      //                 Divider(
      //                   thickness: 1.r,
      //                 ),
      //                 rowTextFieldWidget(
      //                     text: 'Date of Birth', numbers: '10 Oct 1996'),
      //                 Divider(
      //                   thickness: 1.r,
      //                 ),
      //                 rowTextFieldWidget(text: 'Blood Group', numbers: 'B+'),
      //                 Divider(
      //                   thickness: 1.r,
      //                 ),
      //                 rowTextFieldWidget(
      //                     text: 'Emergency Contact', numbers: '+91 23456789'),
      //                 Divider(
      //                   thickness: 1.r,
      //                 ),
      //                 rowTextFieldWidget(
      //                     text: 'Position in class', numbers: '12'),
      //                 Divider(
      //                   thickness: 1.r,
      //                 ),
      //                 rowTextFieldWidget(
      //                     text: "Father's Name", numbers: 'Mr.Raj Shaje'),
      //                 Divider(
      //                   thickness: 1.r,
      //                 ),
      //                 rowTextFieldWidget(
      //                     text: "Mother's Name", numbers: 'Mrs Shria Shaje'),
      //                 size40,
      //                 customButtonWidget(
      //                     boxColor: shockingPink,
      //                     text: 'Ask For Update',
      //                     fontSize: 17.sp,
      //                     textColor: white,
      //                     height: Get.height * 0.06,
      //                     width: Get.width,
      //                     textAlign: TextAlign.center,
      //                     ontap: () => Get.to(() => EnterOtpScreen())),
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  profileCard(imagePath, name, batch) {
    return Container(
      color: bodyBackgroundColor,
      child: Container(
        height: Get.height * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.r),
          ),
          color: appbarColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  circleAvatarWidget(image: imagePath, radius: 60.r),
                  size25,
                  customText(
                    text: '$name',
                    size: 20.sp,
                    color: black,
                  ),
                  size5,
                  customText(
                    text: '$batch',
                    size: 14.sp,
                    color: black,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
