import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training/constants.dart';
import 'package:training/models/certificate_model.dart';
import 'package:training/models/notification_model.dart';
import 'package:training/models/resource_model.dart';

import '../views/teacher_view/certificate_view_screen.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    Key? key,
    this.resourceModel,
    this.onDownload,
  }) : super(key: key);
  final ResourceModel? resourceModel;
  final onDownload;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: appbarColor.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: resourceModel?.resourceTitle == ''
                          ? 'Resource title' * 4
                          : resourceModel?.resourceTitle,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          size5,
          Row(
            children: const [
              Expanded(
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                text: 'Downloads: ${resourceModel?.downloads}',
                size: 12,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: onDownload,
                icon: const Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
