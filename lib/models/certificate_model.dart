// To parse this JSON data, do
//
//     final certificateModel = certificateModelFromJson(jsonString);

import 'dart:convert';

CertificateModel certificateModelFromJson(String str) =>
    CertificateModel.fromJson(json.decode(str));

String certificateModelToJson(CertificateModel data) =>
    json.encode(data.toJson());

class CertificateModel {
  CertificateModel({
    this.alert = 0,
    this.message = '',
    this.certificateId = 0,
    this.certificateTitle = '',
    this.issueDate,
    this.expiryDate,
    this.status = '',
    this.certificatePath = '',
    this.bookName = '',
    this.subjectTitle = '',
    this.courseTitle = '',
    this.teacherName = '',
    this.trainingTitle = '',
  });

  int alert;
  dynamic message;
  int certificateId;
  String certificateTitle;
  DateTime? issueDate;
  DateTime? expiryDate;
  String status;
  dynamic certificatePath;
  String bookName;
  String subjectTitle;
  String courseTitle;
  String teacherName;
  String trainingTitle;

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        certificateId: json["CertificateId"] ?? 0,
        certificateTitle: json["CertificateTitle"] ?? '',
        issueDate: DateTime.parse(json["IssueDate"]),
        expiryDate: DateTime.parse(json["ExpiryDate"]),
        status: json["Status"] ?? '',
        certificatePath: json["CertificatePath"] ?? '',
        bookName: json["BookName"] ?? '',
        subjectTitle: json["SubjectTitle"] ?? '',
        courseTitle: json["CourseTitle"] ?? '',
        teacherName: json["TeacherName"] ?? '',
        trainingTitle: json["TrainingTitle"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "CertificateId": certificateId,
        "CertificateTitle": certificateTitle,
        // "IssueDate": issueDate.toIso8601String(),
        // "ExpiryDate": expiryDate.toIso8601String(),
        "Status": status,
        "CertificatePath": certificatePath,
        "BookName": bookName,
        "SubjectTitle": subjectTitle,
        "CourseTitle": courseTitle,
        "TeacherName": teacherName,
        "TrainingTitle": trainingTitle,
      };
}
