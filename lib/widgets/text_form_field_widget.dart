import 'package:flutter/material.dart';

textFormFieldWidget({
  String? text = '',
  double? fontSize,
  Color? color,
  String? hintText,
  double? hintFontSize,
  bool obscureText = false,
  Color? hintTextColor,
  String? label = '',
  TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label ?? '', style: TextStyle(fontSize: fontSize, color: color)),
      TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            border: InputBorder.none,
            // label: Text(text ?? '',
            //     style: TextStyle(fontSize: fontSize, color: color)),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: hintFontSize,
              color: hintTextColor,
            )),
      ),
    ],
  );
}
