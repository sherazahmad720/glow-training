import 'package:get/get.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/models/book_model.dart';
import 'package:training/models/course_model.dart';
import 'package:training/models/resource_model.dart';
import 'package:training/services/api_services.dart';

import '../models/school_dashboard_model.dart';

class CourseController extends GetxController {
  ApiServices _apiServices = ApiServices();
  AuthController _authController = Get.find();
  CourseCategory selectedCourseCategory = CourseCategory();
  CourseModel selectedCourseModel = CourseModel();
  BookModel selectedBookModel = BookModel();

  List<BookModel> bookList = [];
  List<CourseModel> courseList = [];
  List<ResourceModel> resourceList = [];
  bool courseLoading = false;
  bool booksLoading = false;
  bool resourcesLoading = false;

  getCourses() async {
    courseList.clear();
    courseLoading = true;
    update(['courseLoading']);
    var data =
        await _apiServices.getCourses(selectedCourseCategory.courseCategoryId);
    if (data.isNotEmpty && data[0]['Alert'] == 1) {
      data.forEach((element) {
        courseList.add(CourseModel.fromJson(element));
      });
    }
    courseLoading = false;
    update(['courseLoading']);
  }

  getBooks() async {
    bookList.clear();
    booksLoading = true;
    update(['booksLoading']);
    var data = await _apiServices.getCourseBooks(selectedCourseModel.courseId);
    if (data.isNotEmpty && data[0]['Alert'] == 1) {
      data.forEach((element) {
        BookModel _bookData = BookModel.fromJson(element);
        _bookData.progress = null;
        bookList.add(_bookData);
      });
    }
    booksLoading = false;
    update(['booksLoading']);
  }

  updateResourceDownload(ResourceModel resourceModel) async {
    var data = await _apiServices.updateResourceDownload(
        resourceModel.resourceId, _authController.accountId ?? 0);
    if (data['Alert'] == 1) {
      resourceModel.downloads++;
      update(['resourcesLoading']);
    }
  }

  getResource() async {
    try {
      resourceList.clear();
      resourcesLoading = true;
      update(['resourcesLoading']);
      var data = await _apiServices.getResource(
          selectedBookModel.bookId, _authController.accountId ?? 0);
      if (data.isNotEmpty && data[0]['Alert'] == 1) {
        data.forEach((element) {
          resourceList.add(ResourceModel.fromJson(element));
        });
      }
      resourcesLoading = false;
      update(['resourcesLoading']);
    } catch (e) {
      resourcesLoading = false;
      update(['resourcesLoading']);
    }
  }
}
