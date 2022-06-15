class ResourceModel {
  ResourceModel({
    this.alert = 0,
    this.message = '',
    this.resourceId = 0,
    this.resourceTitle = '',
    this.url = '',
    this.bookId = 0,
    this.downloads = 0,
  });

  int alert;
  String message;
  int resourceId;
  dynamic resourceTitle;
  String url;
  int bookId;
  int downloads;

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        resourceId: json["ResourceId"] ?? 0,
        resourceTitle: json["ResourcesTitle"] ?? '',
        url: json["URL"] ?? '',
        bookId: json["BookId"] ?? 0,
        downloads: json["Downloads"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "ResourceId": resourceId,
        "ResourceTitle": resourceTitle,
        "URL": url,
        "BookId": bookId,
        "Downloads": downloads,
      };
}
