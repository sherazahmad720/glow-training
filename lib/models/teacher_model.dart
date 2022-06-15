// To parse this JSON data, do
//
//     final teacherModel = teacherModelFromJson(jsonString);

import 'dart:convert';

TeacherModel teacherModelFromJson(String str) =>
    TeacherModel.fromJson(json.decode(str));

String teacherModelToJson(TeacherModel data) => json.encode(data.toJson());

class TeacherModel {
  TeacherModel(
      {this.alert = 0,
      this.message = '',
      this.teacherName = '',
      this.mobileForSms = '',
      this.gender = '',
      this.designation = '',
      this.education = '',
      this.experience = '',
      this.status = '',
      this.schoolName = '',
      this.teacherId = 0});

  int alert;
  String message;
  String teacherName;
  String mobileForSms;
  String gender;
  String designation;
  String education;
  String experience;
  String status;
  String schoolName;
  int teacherId;

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        teacherName: json["TeacherName"] ?? '',
        mobileForSms: json["MobileForSMS"] ?? '',
        gender: json["Gender"] ?? '',
        designation: json["Designation"] ?? '',
        education: json["Education"] ?? '',
        experience: json["Experience"] ?? '',
        status: json["Status"] ?? '',
        schoolName: json["SchoolName"] ?? '',
        teacherId: json["TeacherId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "TeacherName": teacherName,
        "MobileForSMS": mobileForSms,
        "Gender": gender,
        "Designation": designation,
        "Education": education,
        "Experience": experience,
        "Status": status,
        "SchoolName": schoolName,
      };
}
