import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget profilePicWidget({
  String? profile = '',
  String? edit = '',
  onTap,
}) {
  return Container(
    width: 42.h,
    height: 42.h,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(profile ??= ''), fit: BoxFit.fill),
      borderRadius: BorderRadius.all(Radius.elliptical(108.r, 108.r)),
    ),
  );
}
