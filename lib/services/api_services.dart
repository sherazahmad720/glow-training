import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApiServices {
  String baseUrl = 'https://training.glowsims.com/api/TrainingAPI/';
  String apiKey = 'M2AjxQr';
  String siteUrl = 'training.glowsims.com/';

  Future login(String userName, String password) async {
    http.Response response = await http.get(Uri.parse(
        baseUrl + 'GetTeacherLoginDetails/$userName/$password/$apiKey'));
    String body = response.body;
    return json.decode(body);
  }

  Future getTeacherProfile(int teacherId) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'getProfile/$teacherId/$apiKey'));

    var body = jsonDecode(response.body);
    var data = body[0];
    return data;
  }

  Future<List> getNotification(int teacherId) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'getNotices/$teacherId/$apiKey'));
    return jsonDecode(response.body);
  }

  Future<List> getCertificates(int teacherId) async {
    http.Response response = await http
        .get(Uri.parse(baseUrl + 'getCertificates/$teacherId/$apiKey'));
    return jsonDecode(response.body);
  }

  Future<List> getTrainings(int teacherId) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'getTrainings/$teacherId/$apiKey'));
    return jsonDecode(response.body);
  }

  Future<List> getBooks(int trainingId) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'getBooks/$trainingId/$apiKey'));
    return jsonDecode(response.body);
  }

  Future<List> getTopics(int bookId, int teacherTrainingLineId) async {
    http.Response response = await http.get(Uri.parse(
        baseUrl + 'getTopics/$bookId/$teacherTrainingLineId/$apiKey'));
    return jsonDecode(response.body);
  }

  Future getContents(int topicId) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'getContents/$topicId/$apiKey'));
    var data = jsonDecode(response.body);
    return data[0];
  }

  String getIdFromUrl(String videoURL) {
    try {
      String? videoID = YoutubePlayer.convertUrlToId(videoURL);
      return videoID ?? '';
    } on Exception catch (exception) {
      print(exception);
      return "";
    } catch (error) {
      print(error);
      return "";
    }
  }

  getProfilePicture(String path) {
    // return path != ''
    //     ? "$siteUrl$path"
    //     : '${siteUrl}Glow-resources/fake_user_pic.png';
    return 'https://picsum.photos/200/300';
  }

  getFilePath(String path) {
    // return 'https://picsum.photos/200/300';
    // return path != ''
    //     ? "$siteUrl$path"
    //     : '${siteUrl}Glow-resources/fake_user_pic.png';
    return path == ''
        ? 'https://training.glowsims.com/images/fake_user_pic.png'
        : siteUrl + path;
  }

  /* -------------------------------------------------------------------------- */
  Future getSchoolProfile(int accountId) async {
    http.Response response = await http
        .get(Uri.parse(baseUrl + 'getSchoolProfile/$accountId/$apiKey'));
    var body = jsonDecode(response.body);
    var data = body[0];
    return data;
  }

  Future getSchoolDashboard() async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'getSchoolDashboard/$apiKey'));
    var body = jsonDecode(response.body);

    return body;
  }

  getTeacherList(int schoolId) async {
    http.Response response = await http
        .get(Uri.parse(baseUrl + 'getTeacherBySchool/$schoolId/$apiKey'));
    var body = jsonDecode(response.body);

    return body;
  }

  getCourses(int courseCategoryId) async {
    http.Response response = await http.get(Uri.parse(
        baseUrl + 'getCourseByCourseCategory/$courseCategoryId/$apiKey'));
    var body = jsonDecode(response.body);

    return body;
  }

  Future<List> getCourseBooks(int courseId) async {
    http.Response response = await http
        .get(Uri.parse(baseUrl + 'getBookByCourse/$courseId/$apiKey'));
    return jsonDecode(response.body);
  }

  getResource(int bookId, int accountId) async {
    http.Response response = await http.get(
        Uri.parse(baseUrl + 'getResourceByBook/$bookId/$accountId/$apiKey'));
    var body = jsonDecode(response.body);

    return body;
  }

  updateResourceDownload(int resourceId, int accountId) async {
    http.Response response = await http.get(Uri.parse(baseUrl +
        'InsertUpdateResourceDownload/$resourceId/$accountId/$apiKey'));
    var body = jsonDecode(response.body);
    return body;
  }
}
