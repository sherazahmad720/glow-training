import 'package:flutter/material.dart';

circleAvatarWidget({
  String image = '',
  double? radius,
  Color? bgColor,
  IconData? icon,
  buttonOnTap,
  double? iconSize,
  bool showImage = true,
}) {
  return InkWell(
    onTap: buttonOnTap,
    child: CircleAvatar(
      backgroundColor: bgColor,
      backgroundImage: showImage ? (NetworkImage(image)) : null,
      radius: radius,
      child: Icon(
        icon,
        size: iconSize,
      ),
    ),
  );
}
