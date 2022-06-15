// To parse this JSON data, do
//
//     final contentModel = contentModelFromJson(jsonString);

import 'dart:convert';

List<ContentModel> contentModelFromJson(String str) => List<ContentModel>.from(
    json.decode(str).map((x) => ContentModel.fromJson(x)));

class ContentModel {
  ContentModel({
    this.contentImage,
    this.contentDoc,
    this.alert = 0,
    this.message = '',
    this.contentId = 0,
    this.contentTitle = '',
    this.searchTags = '',
    this.description = '',
    this.videoUrl = '',
    this.preRequisite = false,
    this.topicId = 0,
  });

  List<Content>? contentImage;
  List<Content>? contentDoc;
  int alert;
  String message;
  int contentId;
  String contentTitle;
  String searchTags;
  String description;
  String videoUrl;
  bool preRequisite;
  int topicId;

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        contentImage: List<Content>.from(
            json["ContentImage"].map((x) => Content.fromJson(x))),
        contentDoc: List<Content>.from(
            json["ContentDoc"].map((x) => Content.fromJson(x))),
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        contentId: json["ContentId"] ?? '',
        contentTitle: json["ContentTitle"] ?? '',
        searchTags: json["SearchTags"] ?? '',
        description: json["Description"] ?? '',
        videoUrl: json["VideoURL"] ?? '',
        preRequisite: json["PreRequisite"] ?? false,
        topicId: json["TopicId"] ?? 0,
      );
}

class Content {
  Content({
    this.alert = 0,
    this.message = '',
    this.contentId = 0,
    this.docPath = '',
    this.imagePath = '',
  });

  int alert;
  String message;
  int contentId;
  String docPath;
  String imagePath;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        contentId: json["ContentId"] ?? 0,
        docPath: json["DocPath"] ?? '',
        imagePath: json["ImagePath"] ?? '',
      );
}
