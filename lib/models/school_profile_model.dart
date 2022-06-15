class SchoolProfileModel {
  SchoolProfileModel({
    this.alert = 0,
    this.message = '',
    this.schoolId = 0,
    this.schoolName = '',
    this.mobileForSms = '',
    this.address = '',
    this.area = '',
    this.totalStudent = 0,
    this.totalEmployee = 0,
    this.totalCampuse = 0,
    this.averageFee = 0,
    this.logoPath = '',
    this.status = '',
  });

  int alert;
  String message;
  int schoolId;
  String schoolName;
  String mobileForSms;
  String address;
  String area;
  int totalStudent;
  int totalEmployee;
  int totalCampuse;
  int averageFee;
  String logoPath;
  String status;

  factory SchoolProfileModel.fromJson(Map<String, dynamic> json) =>
      SchoolProfileModel(
        alert: json["Alert"] ?? 0,
        message: json["Message"] ?? '',
        schoolId: json["SchoolId"] ?? 0,
        schoolName: json["SchoolName"] ?? '',
        mobileForSms: json["MobileForSMS"] ?? '',
        address: json["Address"] ?? '',
        area: json["Area"] ?? '',
        logoPath: json["LogoPath"] ?? '',
        status: json["Status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "Alert": alert,
        "Message": message,
        "SchoolId": schoolId,
        "SchoolName": schoolName,
        "MobileForSMS": mobileForSms,
        "Address": address,
        "Area": area,
        "TotalStudent": totalStudent,
        "TotalEmployee": totalEmployee,
        "TotalCampuse": totalCampuse,
        "AverageFee": averageFee,
        "LogoPath": logoPath,
        "Status": status,
      };
}
