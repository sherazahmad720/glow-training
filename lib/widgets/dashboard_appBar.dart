// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/constants.dart';
import 'package:training/widgets/profile_pic_widget.dart';

Widget dashboardAppBar({
  String? bgImage = '',
  iconOnTap,
  IconData? icon,
  String? name = '',
  String? className = '',
  String profilePic = '',
  profilePicOnTap,
}) {
  return Container(
    decoration: BoxDecoration(
      color: appbarColor,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.r)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 0.r),
            child: Row(
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: iconOnTap,
                    icon: Icon(
                      icon,
                      color: black,
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: name ?? '',
                        color: black,
                        overflow: TextOverflow.ellipsis,
                        maxLine: 1,
                        size: 20.sp,
                        fw: FontWeight.bold,
                      ),
                      customText(
                        overflow: TextOverflow.ellipsis,
                        text: className ?? '',
                        color: black,
                        maxLine: 1,
                        size: 14.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: profilePicWidget(profile: profilePic, onTap: profilePicOnTap),
        ),
      ],
    ),
  );
}
