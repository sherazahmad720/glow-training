import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/book_controller.dart';
import 'package:training/controllers/content_controller.dart';
import 'package:training/controllers/notification_controller.dart';
import 'package:training/controllers/topic_controller.dart';
import 'package:training/services/api_services.dart';
import 'package:training/services/downlaod_service.dart';
import 'package:training/widgets/assignment_card.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/notification_card.dart';
import 'package:training/widgets/row_textfield_widget.dart';

import 'package:training/widgets/training_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentScreen extends StatefulWidget {
  ContentScreen({Key? key}) : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final DownLoadService _downLoadService = DownLoadService();

  final ApiServices _apiServices = ApiServices();

  final AuthController authController = Get.find();

  final ContentController _contentController = Get.put(ContentController());
  bool isDescriptionExpanded = false;
  bool isAttachmentsExpanded = false;
  final TopicController topicController = Get.find();
  @override
  void initState() {
    _contentController.getContent();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(
          child: GetBuilder<ContentController>(builder: (contentController) {
        return contentController.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: appbarColor,
                ),
              )
            : YoutubePlayerBuilder(
                player: YoutubePlayer(
                  aspectRatio: 16 / 9,
                  thumbnail: Icon(Icons.play_arrow),
                  controller: contentController.ytController!,
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    FullScreenButton()
                  ],
                ),
                builder: (context, player) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* --------------------------------- AppBar --------------------------------- */
                      customAppBar(
                          text: topicController.selectedTopic?.topicTitle,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // rowTextFieldWidget(
                                //   text: 'Trainer Name',
                                //   numbers:
                                //       '_bookController.selectedBook?.trainerName',
                                // ),
                                size20,
                                customText(
                                  text: contentController.content.contentTitle,
                                  size: 20,
                                ),
                                size20,
                                player,
                                size10,

                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    customText(
                                                      text: 'Description',
                                                      size: 20,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isDescriptionExpanded =
                                                              !isDescriptionExpanded;
                                                        });
                                                      },
                                                      icon: Icon(!isDescriptionExpanded
                                                          ? Icons
                                                              .keyboard_arrow_down
                                                          : Icons
                                                              .keyboard_arrow_up),
                                                    )
                                                  ],
                                                ),
                                                if (isDescriptionExpanded)
                                                  customText(
                                                    text: contentController
                                                        .content.description,
                                                    size: 15,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    customText(
                                                      text: 'Attachments',
                                                      size: 20,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          isAttachmentsExpanded =
                                                              !isAttachmentsExpanded;
                                                        });
                                                      },
                                                      icon: Icon(!isAttachmentsExpanded
                                                          ? Icons
                                                              .keyboard_arrow_down
                                                          : Icons
                                                              .keyboard_arrow_up),
                                                    )
                                                  ],
                                                ),
                                                if (isAttachmentsExpanded) ...[
                                                  customText(
                                                      text: 'Documents',
                                                      size: 16,
                                                      fw: FontWeight.w300),
                                                  for (var i = 0;
                                                      i <
                                                          (contentController
                                                                      .content
                                                                      .contentDoc ??
                                                                  [])
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: assignmentCard(
                                                        i.toString(),
                                                        // '.jpg',
                                                        contentController
                                                            .content
                                                            .contentDoc![i]
                                                            .docPath
                                                            .split('.')
                                                            .last,
                                                        () {
                                                          _downLoadService.download(
                                                              context,
                                                              _apiServices.getFilePath(
                                                                  contentController
                                                                      .content
                                                                      .contentDoc![
                                                                          i]
                                                                      .docPath),
                                                              contentController
                                                                  .content
                                                                  .contentDoc![
                                                                      i]
                                                                  .docPath
                                                                  .split('/')
                                                                  .last);
                                                        },
                                                      ),
                                                    ),
                                                  customText(
                                                    text: 'Pictures',
                                                    fw: FontWeight.w300,
                                                    size: 16,
                                                  ),
                                                  for (var i = 0;
                                                      i <
                                                          (contentController
                                                                      .content
                                                                      .contentImage ??
                                                                  [])
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: assignmentCard(
                                                        i.toString(),
                                                        // '.jpg',
                                                        contentController
                                                            .content
                                                            .contentImage![i]
                                                            .imagePath
                                                            .split('.')
                                                            .last,
                                                        () {
                                                          _downLoadService.download(
                                                              context,
                                                              _apiServices.getFilePath(
                                                                  contentController
                                                                      .content
                                                                      .contentImage![
                                                                          i]
                                                                      .imagePath),
                                                              contentController
                                                                  .content
                                                                  .contentImage![
                                                                      i]
                                                                  .imagePath
                                                                  .split('/')
                                                                  .last);
                                                        },
                                                      ),
                                                    ),
                                                ]
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        // ),
                      ))
                    ],
                  );
                });
      })),
    );
  }
}
