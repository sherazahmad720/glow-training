import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

Widget assignmentCard(text, extension, onTap) {
  return Container(
    decoration: BoxDecoration(
        color: const Color(0xFFE6908A),
        borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE47968)),
                  color: const Color(0xFFE47968),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: customText(
                  color: Colors.white,
                  text: extension,
                ),
              )),
          size5,
          // Expanded(
          //   child: Column(
          //     children: [
          //       customText(
          //         color: black,
          //         text: text,
          //       ),
          //     ],
          //   ),
          // ),
          size15,
          InkWell(onTap: onTap, child: Icon(Icons.download))
        ],
      ),
    ),
  );
}
