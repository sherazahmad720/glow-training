// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.alert = 0,
    this.message = '',
    this.noticeId = 0,
    this.noticeTitle = '',
    this.date,
    this.description = '',
  });

  int alert;
  dynamic message;
  int noticeId;
  String noticeTitle;
  DateTime? date;
  String description;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        noticeId: json["NoticeId"] ?? 0,
        noticeTitle: json["NoticeTitle"] ?? '',
        date: DateTime.parse(json["Date"]),
        description: json["Description"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "NoticeId": noticeId,
        "NoticeTitle": noticeTitle,
        // "Date": date.toIso8601String(),
        "Description": description,
      };
}
