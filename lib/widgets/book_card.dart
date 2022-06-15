import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:training/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget bookCard({
  context,
  String? image = '',
  String? heading = '',
  String? className = '',
  double? progress,
  onTap,
}) {
  return
      // Row(
      //   children: [
      InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(0.r),
      child: Container(
        width: 160.w,
        height: 156.h,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
            color: appbarColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image ?? '',
                height: 140.h,
                width: 115.w,
                fit: BoxFit.fill,
              ),
            ),
            size15,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      text: heading ?? '',
                      color: black,
                      maxLine: 2,
                      size: 24.sp,
                      fw: FontWeight.bold),
                  // size5,
                  customText(
                    text: className ?? '',
                    //  ,
                    color: black,
                    size: 22.sp,
                  ),
                  Spacer(),
                  if (progress != null) ...[
                    customText(
                      text: '${progress.toStringAsFixed(2)}% Completed',
                      color: black,
                      size: 16.sp,
                    ),
                    size5,
                    StepProgressIndicator(
                      totalSteps: 10000,
                      currentStep: (progress * 100).toInt(),
                      size: 5,
                      padding: 0,
                      selectedColor: Colors.black,
                      unselectedColor: black.withOpacity(0.2),
                      roundedEdges: Radius.circular(4),
                    )
                  ]
                ],
              ),
            ),
          ],
        ),
        // ),
        // size10,
        // ]
      ),
    ),
  );
}
