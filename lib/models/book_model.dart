// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    this.alert = 0,
    this.message = '',
    this.teacherTrainingLineId = 0,
    this.bookId = 0,
    this.bookName = '',
    this.description = '',
    this.introductionVideoUrl = '',
    this.bookCoverPath = '',
    this.subjectTitle = '',
    this.courseTitle = '',
    this.trainerName = '',
    this.trainerContact = '',
    this.progress = 0.0,
  });

  int alert;
  String message;
  int teacherTrainingLineId;
  int bookId;
  String bookName;
  String description;
  String introductionVideoUrl;
  String bookCoverPath;
  String subjectTitle;
  String courseTitle;
  String trainerName;
  String trainerContact;
  double? progress;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        teacherTrainingLineId: json["TeacherTrainingLineId"] ?? 0,
        bookId: json["BookId"] ?? 0,
        bookName: json["BookName"] ?? '',
        description: json["Description"] ?? '',
        introductionVideoUrl: json["IntroductionVideoURL"] ?? '',
        bookCoverPath: json["BookCoverPath"] ?? '',
        subjectTitle: json["SubjectTitle"] ?? '',
        courseTitle: json["CourseTitle"] ?? '',
        trainerName: json["TrainerName"] ?? '',
        trainerContact: json["TrainerContact"] ?? '',
        progress: json["Progress"],
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "TeacherTrainingLineId": teacherTrainingLineId,
        "BookId": bookId,
        "BookName": bookName,
        "Description": description,
        "IntroductionVideoURL": introductionVideoUrl,
        "BookCoverPath": bookCoverPath,
        "SubjectTitle": subjectTitle,
        "CourseTitle": courseTitle,
        "TrainerName": trainerName,
        "TrainerContact": trainerContact,
        "Progress": progress,
      };
}
