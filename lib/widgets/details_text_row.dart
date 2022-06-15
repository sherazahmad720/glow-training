import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/constants.dart';

Widget detailsTextRow({
  String? text = '',
  String? numbers = '',
  Color? hintTextColor,
  isEnableHeight = true,
}) {
  return Container(
    height: isEnableHeight ? 40.h : null,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            text ?? '',
            style: TextStyle(color: black, fontSize: 14.sp),
          ),
        ),
        // size80,
        // Spacer(),
        Expanded(
          child: Text(
            numbers ?? '',
            style: TextStyle(color: hintTextColor ?? black, fontSize: 14.sp),
          ),
        ),
      ],
    ),
  );
}
