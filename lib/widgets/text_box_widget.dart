import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

textBoxWidget({
  String? numbers = '',
  String? text = '',
  Color? numbersColor,
  Color? textColor,
  Color? boxColor,
}) {
  return Container(
    height: 50.h,
    width: 85.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r), color: boxColor),
    child: Padding(
      padding: EdgeInsets.all(3.r),
      child: Column(
        children: [
          Center(
            child: Text(
              numbers ?? '',
              style: TextStyle(
                color: numbersColor,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
              child: Text(
            text ?? '',
            style: TextStyle(
              color: textColor,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    ),
  );
}
