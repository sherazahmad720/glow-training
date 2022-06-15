import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/course_controller.dart';
import 'package:training/services/api_services.dart';
import 'package:training/services/downlaod_service.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/resource_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final CourseController _courseController = Get.put(CourseController());
  final ApiServices _apiServices = ApiServices();
  final DownLoadService _downLoadService = DownLoadService();

  ResourceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _courseController.getResource();

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(
          child: GetBuilder<CourseController>(
              id: 'resourcesLoading',
              builder: (resourceController) {
                return resourceController.resourcesLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: appbarColor,
                        ),
                      )
                    : Column(
                        children: [
                          /* --------------------------------- AppBar --------------------------------- */
                          customAppBar(
                              text: 'Resources',
                              icon: Icons.arrow_back,
                              onTap: () => Get.back()),
                          /* ---------------------------------- Body ---------------------------------- */
                          Expanded(
                              child: Container(
                            width: Get.width,
                            color: appbarColor,
                            child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.r, 0.r, 20.r, 20.r),
                                decoration: BoxDecoration(
                                  color: bodyBackgroundColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25.r),
                                  ),
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.only(top: 30),
                                  itemCount:
                                      resourceController.resourceList.length,
                                  itemBuilder: (context, index) {
                                    return ResourceCard(
                                      onDownload: () async {
                                        // await _downLoadService.download(
                                        //     context,
                                        //     resourceController
                                        //         .resourceList[index].url,
                                        //     resourceController
                                        //             .resourceList[index]
                                        //             .resourceTitle +
                                        //         '.pdf');
                                        resourceController
                                            .updateResourceDownload(
                                                resourceController
                                                    .resourceList[index]);
                                        !await launchUrl(
                                          Uri.parse(resourceController
                                              .resourceList[index].url),
                                          mode: LaunchMode.externalApplication,
                                        );
                                        throw 'Could not launch ';
                                      },
                                      resourceModel: resourceController
                                          .resourceList[index],
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
