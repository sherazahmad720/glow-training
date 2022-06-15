// To parse this JSON data, do
//
//     final schoolDashboardModel = schoolDashboardModelFromJson(jsonString);

import 'dart:convert';

SchoolDashboardModel schoolDashboardModelFromJson(String str) =>
    SchoolDashboardModel.fromJson(json.decode(str));

String schoolDashboardModelToJson(SchoolDashboardModel data) =>
    json.encode(data.toJson());

class SchoolDashboardModel {
  SchoolDashboardModel({
    this.courseCategory,
    this.glowSimsAdDs,
    this.alert = 0,
    this.message = '',
  });

  List<CourseCategory>? courseCategory;
  List<GlowSimsAdd>? glowSimsAdDs;
  int alert;
  String message;

  factory SchoolDashboardModel.fromJson(Map<String, dynamic> json) =>
      SchoolDashboardModel(
        courseCategory: List<CourseCategory>.from(
            json["CourseCategory"].map((x) => CourseCategory.fromJson(x))),
        glowSimsAdDs: List<GlowSimsAdd>.from(
            json["GlowSimsADDs"].map((x) => GlowSimsAdd.fromJson(x))),
        alert: json["Alert"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "CourseCategory":
            List<dynamic>.from(courseCategory!.map((x) => x.toJson())),
        "GlowSimsADDs":
            List<dynamic>.from(glowSimsAdDs!.map((x) => x.toJson())),
        "Alert": alert,
        "Message": message,
      };
}

class CourseCategory {
  CourseCategory({
    this.alert = 0,
    this.message = '',
    this.courseCategoryId = 0,
    this.courseCategoryTitle = '',
  });

  int alert;
  String message;
  int courseCategoryId;
  String courseCategoryTitle;

  factory CourseCategory.fromJson(Map<String, dynamic> json) => CourseCategory(
        alert: json["Alert"],
        message: json["Message"] == null ? '' : json["Message"],
        courseCategoryId: json["CourseCategoryId"],
        courseCategoryTitle: json["CourseCategoryTitle"],
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message == null ? '' : message,
        "CourseCategoryId": courseCategoryId,
        "CourseCategoryTitle": courseCategoryTitle,
      };
}

class GlowSimsAdd {
  GlowSimsAdd({
    this.alert = 0,
    this.message = '',
    this.adUrl = '',
    this.clickUrl = '',
  });

  int alert;
  String message;
  String adUrl;
  String clickUrl;

  factory GlowSimsAdd.fromJson(Map<String, dynamic> json) => GlowSimsAdd(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        adUrl: json["AdURL"] ?? '',
        clickUrl: json["ClickURL"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "AdURL": adUrl,
        "ClickURL": clickUrl,
      };
}
