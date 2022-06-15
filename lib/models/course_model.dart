class CourseModel {
  CourseModel({
    this.alert = 0,
    this.message = '',
    this.courseId = 0,
    this.courseTitle = '',
  });

  int alert;
  String message;
  int courseId;
  String courseTitle;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        courseId: json["CourseId"] ?? 0,
        courseTitle: json["CourseTitle"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "CourseId": courseId,
        "CourseTitle": courseTitle,
      };
}
