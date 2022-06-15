import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training/constants.dart';
import 'package:training/models/certificate_model.dart';
import 'package:training/models/notification_model.dart';

import '../views/teacher_view/certificate_view_screen.dart';

class CertificateCard extends StatefulWidget {
  const CertificateCard({
    Key? key,
    this.certificateModel,
    this.onView,
    this.onDownload,
  }) : super(key: key);
  final CertificateModel? certificateModel;
  final onView;
  final onDownload;

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: appbarColor.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: widget.certificateModel?.trainingTitle ?? '',
                        size: 20,
                      ),
                      size10,
                      customText(
                        text: widget.certificateModel?.bookName ?? '',
                        size: 16,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            if (isExpanded) ...[
              size20,
              // detailsTextRow(
              //   text: 'Certificate Title:',
              //   numbers: widget.certificateModel?.certificateTitle ?? '',
              // ),
              // detailsTextRow(
              //   text: 'Issue Date:',
              //   numbers: DateFormat('dd-MM-yyyy').format(
              //       widget.certificateModel?.issueDate ?? DateTime.now()),
              // ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              size5,
              Row(
                children: [
                  Expanded(
                    child: customText(
                      text: widget.certificateModel?.certificateTitle ?? '',
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.onDownload,
                    icon: const Icon(
                      Icons.file_download,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: widget.onView,
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
