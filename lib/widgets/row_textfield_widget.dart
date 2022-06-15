import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/constants.dart';

Widget rowTextFieldWidget({
  String? text = '',
  String? numbers = '',
  Color? hintTextColor,
}) {
  return Container(
    height: 40.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            child: TextField(
          decoration: InputDecoration(
            enabled: false,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: hintTextColor,
                fontWeight: FontWeight.bold),
            hintText: numbers ?? '',
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: 14.sp, color: black),
        )),
      ],
    ),
  );
}
