// To parse this JSON data, do
//
//     final topicModel = topicModelFromJson(jsonString);

import 'dart:convert';

TopicModel topicModelFromJson(String str) =>
    TopicModel.fromJson(json.decode(str));

String topicModelToJson(TopicModel data) => json.encode(data.toJson());

class TopicModel {
  TopicModel(
      {this.alert = 0,
      this.message = '',
      this.topicId = 0,
      this.topicTitle = '',
      this.bookId = 0,
      this.passStatus = 0,
      this.permission = 0,
      this.preRequisite = true});

  int alert;
  dynamic message;
  int topicId;
  String topicTitle;
  int bookId;
  bool preRequisite;
  int permission;
  int passStatus;

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
      alert: json["Alert"] ?? 0,
      message: json["Message"] ?? '',
      topicId: json["TopicId"] ?? 0,
      topicTitle: json["TopicTitle"] ?? '',
      bookId: json["BookId"] ?? 0,
      passStatus: json["PassStatus"] ?? 0,
      permission: json["Permission"] ?? 0,
      preRequisite: json["PreRequisite"] ?? false);

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "TopicId": topicId,
        "TopicTitle": topicTitle,
        "BookId": bookId,
        "PassStatus": passStatus,
        "Permission": permission,
        "PreRequisite": preRequisite
      };
}
