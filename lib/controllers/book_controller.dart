import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:training/controllers/dashboard_controller.dart';

import '../models/book_model.dart';
import '../services/api_services.dart';

class BookController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final DashboardController _dashboardController = Get.find();
  BookModel? selectedBook;
  List<BookModel> bookList = [];
  bool loading = false;
  getBooks() async {
    try {
      bookList.clear();
      loading = true;
      update();
      List list = await _apiServices.getBooks(
          _dashboardController.selectedTraining?.teacherTrainingId ?? 0);
      if (list.isNotEmpty && list[0]['Alert'] == 1) {
        list.forEach((element) {
          bookList.add(BookModel.fromJson(element));
        });
      }
      loading = false;
      update();
    } catch (e) {
      loading = false;
      update();
    }
  }
}
