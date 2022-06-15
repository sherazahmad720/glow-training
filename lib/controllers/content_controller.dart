import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/topic_controller.dart';
import 'package:training/services/api_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/content_model.dart';

class ContentController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final TopicController _topicController = Get.find();
  YoutubePlayerController? ytController;

  bool loading = false;
  ContentModel content = ContentModel();
  ContentModel? selectedContent;
  getContent() async {
    try {
      {
        loading = true;
        update();
        var data = await _apiServices
            .getContents(_topicController.selectedTopic?.topicId ?? 0);
        content = ContentModel.fromJson(data);
        addUrl();
        loading = false;
        update();
      }
    } catch (e) {
      loading = false;
      update();
    }
  }

  addUrl() {
    ytController = YoutubePlayerController(
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
            disableDragSeek: true,
            loop: false,
            enableCaption: false),
        initialVideoId: _apiServices.getIdFromUrl(content.videoUrl));
  }
}
