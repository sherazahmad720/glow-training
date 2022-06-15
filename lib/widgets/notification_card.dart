import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training/constants.dart';
import 'package:training/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, this.notificationModel}) : super(key: key);
  final NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: primaryColor.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: customText(
                    text: notificationModel?.noticeTitle,
                    size: 20,
                  ),
                ),
                // customText(
                //   text: DateFormat('dd/MM/yyyy')
                //       .format(notificationModel?.date ?? DateTime.now()),
                //   color: shockingPink,
                //   size: 14,
                // ),
              ],
            ),
            size10,
            customText(
              text: notificationModel?.description ?? '',
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
