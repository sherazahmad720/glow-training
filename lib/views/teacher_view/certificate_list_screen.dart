import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/certificate_controller.dart';
import 'package:training/services/api_services.dart';
import 'package:training/services/downlaod_service.dart';
import 'package:training/views/teacher_view/certificate_view_screen.dart';
import 'package:training/widgets/certificate_card.dart';
import 'package:training/widgets/custom_appbar.dart';

class CertificateListScreen extends StatelessWidget {
  final AuthController authController = Get.find();
  final CertificateController _certificateController =
      Get.put(CertificateController());
  final ApiServices _apiServices = ApiServices();
  final DownLoadService _downLoadService = DownLoadService();

  CertificateListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _certificateController.getCertificate();

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(child:
          GetBuilder<CertificateController>(builder: (certificateController) {
        return certificateController.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: appbarColor,
                ),
              )
            : Column(
                children: [
                  /* --------------------------------- AppBar --------------------------------- */
                  customAppBar(
                      text: 'Certificates',
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
                          itemCount:
                              certificateController.certificateList.length,
                          itemBuilder: (context, index) {
                            return CertificateCard(
                              onDownload: () {
                                _downLoadService.download(
                                    context,
                                    _apiServices.getFilePath(
                                        certificateController
                                            .certificateList[index]
                                            .certificatePath),
                                    certificateController.certificateList[index]
                                            .certificateTitle +
                                        '.' +
                                        _apiServices
                                            .getFilePath(certificateController
                                                .certificateList[index]
                                                .certificatePath)
                                            .split('.')
                                            .last);
                              },
                              onView: () {
                                Get.to(() => CertificateViewScreen(
                                    link: _apiServices.getFilePath(
                                        certificateController
                                            .certificateList[index]
                                            .certificatePath),
                                    name: certificateController
                                        .certificateList[index]
                                        .certificateTitle));
                              },
                              certificateModel:
                                  certificateController.certificateList[index],
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
