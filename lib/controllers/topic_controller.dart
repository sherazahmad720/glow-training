import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/book_controller.dart';
import 'package:training/models/topic_model.dart';
import 'package:training/services/api_services.dart';

import '../models/book_model.dart';

class TopicController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final BookController _bookController = Get.find();

  List<TopicModel> topicList = [];
  TopicModel? selectedTopic;
  getTopic() async {
    try {
      topicList.clear();
      update();
      List list = await _apiServices.getTopics(
          _bookController.selectedBook?.bookId ?? 0,
          _bookController.selectedBook?.teacherTrainingLineId ?? 0);
      if (list.isNotEmpty && list[0]['Alert'] == 1) {
        list.forEach((element) {
          topicList.add(TopicModel.fromJson(element));
        });
      }
      update();
    } catch (e) {
      update();
    }
  }
}
