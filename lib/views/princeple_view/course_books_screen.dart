import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:training/constants.dart';
import 'package:training/controllers/auth_controller.dart';
import 'package:training/controllers/book_controller.dart';
import 'package:training/controllers/course_controller.dart';
import 'package:training/controllers/dashboard_controller.dart';
import 'package:training/controllers/notification_controller.dart';
import 'package:training/services/api_services.dart';
import 'package:training/views/princeple_view/resource_screen.dart';
import 'package:training/views/teacher_view/topic_screen.dart';
import 'package:training/widgets/custom_appbar.dart';
import 'package:training/widgets/book_card.dart';
import 'package:training/widgets/notification_card.dart';

class CourseBooksScreen extends StatelessWidget {
  final CourseController _courseController = Get.put(CourseController());

  CourseBooksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _courseController.getBooks();

    return Scaffold(
      backgroundColor: bodyBackgroundColor,
      body: SafeArea(
          child: GetBuilder<CourseController>(
              id: 'booksLoading',
              builder: (courseController) {
                return courseController.booksLoading
                    ? Center(
                        child: Center(
                        child: CircularProgressIndicator(
                          color: appbarColor,
                        ),
                      ))
                    : Column(
                        children: [
                          /* --------------------------------- AppBar --------------------------------- */
                          customAppBar(
                              text: 'Books',
                              icon: Icons.arrow_back,
                              onTap: () => Get.back()),
                          /* ---------------------------------- Body ---------------------------------- */
                          Expanded(
                              child: Container(
                                  width: Get.width,
                                  color: appbarColor,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        0.r, 0.r, 0.r, 20.r),
                                    decoration: BoxDecoration(
                                      color: bodyBackgroundColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25.r),
                                      ),
                                    ),
                                    child: ListView.builder(
                                        padding: EdgeInsets.all(15),
                                        itemCount:
                                            courseController.bookList.length,
                                        itemBuilder: (ctx, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: bookCard(
                                              progress: courseController
                                                  .bookList[index].progress,
                                              onTap: () {
                                                courseController
                                                        .selectedBookModel =
                                                    courseController
                                                        .bookList[index];
                                                Get.to(() => ResourceScreen());
                                              },
                                              image: ApiServices().getFilePath(
                                                  courseController
                                                      .bookList[index]
                                                      .bookCoverPath),
                                              heading: courseController
                                                  .bookList[index].bookName,
                                              className: courseController
                                                  .bookList[index].courseTitle,
                                            ),
                                          );
                                        }),
                                    // child: GridView.builder(
                                    //     padding: EdgeInsets.all(20),
                                    //     itemCount: bookController.bookList.length,
                                    //     gridDelegate:
                                    //         const SliverGridDelegateWithFixedCrossAxisCount(
                                    //       mainAxisSpacing: 10,
                                    //       crossAxisSpacing: 10,
                                    //       crossAxisCount: 2,
                                    //     ),
                                    //     itemBuilder: (ctx, index) {
                                    //       return bookCard(
                                    //         onTap: () {
                                    //           bookController.selectedBook =
                                    //               bookController.bookList[index];
                                    //           Get.to(() => TopicScreen());
                                    //         },
                                    //         image: ApiServices().getFilePath(
                                    //             bookController
                                    //                 .bookList[index].bookCoverPath),
                                    //         heading:
                                    //             bookController.bookList[index].bookName,
                                    //       );
                                    //     }),
                                  )
                                  // ),
                                  ))
                        ],
                      );
              })),
    );
  }
}
