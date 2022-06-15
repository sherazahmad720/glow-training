import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/book_controller.dart';
import 'package:training/controllers/topic_controller.dart';
import 'package:training/models/topic_model.dart';
import 'package:training/services/api_services.dart';
import 'package:training/views/teacher_view/content_screen.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/row_textfield_widget.dart';
import 'package:training/widgets/training_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../widgets/details_text_row.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen({Key? key}) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final AuthController authController = Get.find();

  final TopicController _topicController = Get.put(TopicController());

  final BookController _bookController = Get.find();

  final ApiServices _apiServices = ApiServices();
  bool isDetailsExpanded = false;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: _apiServices.getIdFromUrl(
          _bookController.selectedBook?.introductionVideoUrl ?? ''),
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: true,
          loop: false,
          enableCaption: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    _topicController.getTopic();
    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(
          child: GetBuilder<TopicController>(builder: (topicController) {
        return Column(
          children: [
            /* --------------------------------- AppBar --------------------------------- */
            customAppBar(
                text: _bookController.selectedBook?.bookName,
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
                      size20,
                      customText(
                        text: 'Introduction',
                        size: 20,
                      ),
                      Card(
                        color: Colors.grey[300],
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 150,
                          color: Colors.blue,
                          child: YoutubePlayer(
                            controller: _controller,
                            thumbnail: Icon(Icons.play_arrow),
                            topActions: [],
                            bottomActions: [
                              CurrentPosition(),
                              // FullScreenButton(),
                              ProgressBar(isExpanded: true),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              size10,
                              DetailsCard(),
                              size10,
                              customText(
                                text: 'Topics',
                                size: 20,
                              ),
                              size10,
                              for (var topic in topicController.topicList)
                                TrainingCard(
                                  isTopicCard: true,
                                  isEnable: (isEnable(topic)),
                                  title: topic.topicTitle,
                                  status: topic.passStatus == 1,
                                  onTap: () {
                                    if (isEnable(topic)) {
                                      topicController.selectedTopic = topic;
                                      Get.to(() => ContentScreen());
                                    }
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      // ListView.builder(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   itemCount: topicController.topicList.length,
                      //   itemBuilder: (context, index) {

                      //   },
                      // ),
                    ],
                  )),
              // ),
            ))
          ],
        );
      })),
    );
  }

  bool isEnable(TopicModel topic) {
    if (topic.permission == 1 || !topic.preRequisite) {
      return true;
    }
    return false;
  }
}

class DetailsCard extends StatefulWidget {
  DetailsCard({Key? key}) : super(key: key);
  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  BookController _bookController = Get.find();

  bool isDetailsExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customText(
                  text: 'Details',
                  size: 20,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isDetailsExpanded = !isDetailsExpanded;
                    });
                  },
                  icon: Icon(!isDetailsExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up),
                )
              ],
            ),
            if (isDetailsExpanded) ...[
              detailsTextRow(
                text: 'Course',
                numbers: _bookController.selectedBook?.courseTitle,
              ),
              detailsTextRow(
                text: 'Subject',
                numbers: _bookController.selectedBook?.subjectTitle,
              ),
              detailsTextRow(
                text: 'Trainer Name',
                numbers: _bookController.selectedBook?.trainerName,
              ),
              detailsTextRow(
                isEnableHeight: false,
                text: 'Description',
                numbers: _bookController.selectedBook?.description,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
