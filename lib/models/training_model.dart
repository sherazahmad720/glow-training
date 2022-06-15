// To parse this JSON data, do
//
//     final trainingModel = trainingModelFromJson(jsonString);

import 'dart:convert';

TrainingModel trainingModelFromJson(String str) =>
    TrainingModel.fromJson(json.decode(str));

String trainingModelToJson(TrainingModel data) => json.encode(data.toJson());

class TrainingModel {
  TrainingModel({
    this.alert = 0,
    this.message = '',
    this.teacherTrainingId = 0,
    this.teacherName = '',
    this.trainingTitle = '',
  });

  int alert;
  String message;
  int teacherTrainingId;
  String teacherName;
  String trainingTitle;

  factory TrainingModel.fromJson(Map<String, dynamic> json) => TrainingModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        teacherTrainingId: json["TeacherTrainingId"] ?? 0,
        teacherName: json["TeacherName"] ?? '',
        trainingTitle: json["TrainingTitle"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "TeacherTrainingId": teacherTrainingId,
        "TeacherName": teacherName,
        "TrainingTitle": trainingTitle,
      };
}
