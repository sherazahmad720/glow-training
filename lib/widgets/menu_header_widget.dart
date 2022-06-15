import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/widgets/circle_avatar_widget.dart';

import '../constants.dart';

Widget menuHeaderWidget({
  profileOnTap,
  String? name = '',
  String? className = '',
  Color? nameColor,
  buttonOntap,
  String? profilePic = '',
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 20.r),
          child: Row(
            children: [
              if (profilePic != '')
                circleAvatarWidget(
                    image: profilePic ?? '',
                    radius: 30.r,
                    buttonOnTap: profileOnTap),
              size15,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        text: name,
                        maxLine: 1,
                        overflow: TextOverflow.ellipsis,
                        color: nameColor,
                        size: 20.sp,
                        fw: FontWeight.bold),
                    customText(
                        text: className,
                        color: black,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                        size: 14.sp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      IconButton(
          onPressed: buttonOntap,
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ))
    ],
  );
}

Widget performanceHeaderWidget({
  profileOnTap,
  String? name = '',
  String? className = '',
  Color? nameColor,
  buttonOntap,
  String? profilePic = '',
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 0.r, top: 10.r),
          child: Row(
            children: [
              // if (profilePic != '')
              //   circleAvatarWidget(
              //       image: profilePic ?? '',
              //       radius: 30.r,
              //       buttonOnTap: profileOnTap),
              // size15,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        text: name,
                        color: nameColor,
                        size: 20.sp,
                        fw: FontWeight.bold),
                    customText(text: className, color: black, size: 14.sp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
