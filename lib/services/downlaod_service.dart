import 'dart:io';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:training/services/api_services.dart';

class DownLoadService {
  final ApiServices _apiServices = ApiServices();
  bool isLoading = true;
  String progress = '';
  Dio? dio = Dio();
  Future<bool> download(
      BuildContext context, String url, String fileName) async {
    ProgressDialog pr = ProgressDialog(
      context: context,
    );
    try {
      var per = await askPermission();
      if (per!.isGranted) {
        pr.show(max: 100, msg: 'File Downloading...');
        var dir = await p.getExternalStorageDirectories(
            type: p.StorageDirectory.downloads);
        const path = '/storage/emulated/0/Download/';
        final file = File('$path/$fileName');
        await dio!.download(url, file.path, onReceiveProgress: (rec, total) {
          isLoading = true;
          progress = ((rec / total) * 100).toStringAsFixed(0) + " %";
          pr.update(value: (rec ~/ total) * 100);
        });
        pr.close();

        Get.snackbar('Success', 'File downloaded successfully',
            backgroundColor: Colors.green.withOpacity(0.4));
      } else {
        Get.snackbar('Error', 'please grant storage permission',
            backgroundColor: Colors.red.withOpacity(0.4));
      }
      return true;
    } catch (e) {
      pr.close();
      Get.snackbar('Error', '${e.toString}',
          backgroundColor: Colors.red.withOpacity(0.4));
      print(e);
      return false;
    }
  }

  Future<PermissionStatus?> askPermission() async {
    Permission _permission = Permission.storage;
    PermissionStatus _status = await _permission.request();
    if (_status.isPermanentlyDenied) {
      Get.defaultDialog(
        title: 'Permission',
        content: const Text('Please grant storage permission'),
        actions: [
          InkWell(
            onTap: () async {
              Get.back();
              await openAppSettings();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.blue[300]),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Open settings'),
              ),
            ),
          ),
        ],
      );
    }
    return _status;
  }
}
