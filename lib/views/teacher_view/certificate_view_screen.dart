import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:training/services/downlaod_service.dart';

class CertificateViewScreen extends StatelessWidget {
  CertificateViewScreen({Key? key, required this.link, required this.name})
      : super(key: key);
  final String link, name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: NetworkImage(link),
      ),
    );
  }
}
