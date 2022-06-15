import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:training/constants.dart';

customAppBar({
  String? text = '',
  IconData? icon,
  onTap,
}) {
  return Container(
    height: Get.height * 0.09,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25.r),
      ),
      color: appbarColor,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //size10,
          Row(
            children: [
              IconButton(onPressed: onTap, icon: Icon(icon, color: black)),
              customText(
                  text: text ?? '',
                  size: 20.sp,
                  color: black,
                  fw: FontWeight.bold)
            ],
          )
        ],
      ),
    ),
  );
}
