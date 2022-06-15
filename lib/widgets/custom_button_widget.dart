import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customButtonWidget(
    {Color? boxColor,
    String? text = '',
    Color? textColor,
    double? fontSize,
    TextAlign? textAlign,
    double? height,
    double? width,
    ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.all(Radius.circular(25.r))),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
            textAlign: textAlign,
          ),
        )),
  );
}
