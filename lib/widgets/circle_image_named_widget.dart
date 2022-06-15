import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

circleImageNamedWidget({
  IconData? icon,
  double? size,
  Color? bgColor = Colors.white,
  double? radius = 30,
  String? text = '',
  onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: bgColor,
          child: Icon(
            icon,
            size: 35,
            color: appbarColor,
          ),
        ),
        size10,
        Text(
          text ?? '',
          style: TextStyle(
              color: black, fontSize: 16.sp, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
