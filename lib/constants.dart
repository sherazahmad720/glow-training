import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

String schoolInfoURL =
    'https://billing.glowsims.com/api/glowmanager/geturldetail/A7wSM9q/';
NumberFormat nf = NumberFormat("###,###.##", "en_US");
Widget customText({
  String? text = '',
  FontWeight? fw,
  TextOverflow overflow = TextOverflow.clip,
  Color? color,
  double? size,
  TextAlign? textAlign,
  FontStyle? fontStyle,
  onTap,
  int? maxLine,
}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text!,
      maxLines: maxLine,
      style: TextStyle(
          overflow: overflow,
          color: color,
          fontSize: size,
          fontWeight: fw,
          fontStyle: fontStyle),
      textAlign: textAlign,
    ),
  );
}

Widget myDecoration({
  String image = '',
  fit,
  height,
  width,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: fit)),
  );
}

//Color blue = const Color(0xFF473F97);
//Color blue = const Color(0xFF29387F);

Color iceBlue = const Color(0xFFD4F5FF);
Color black = Colors.black;
Color grey = Colors.grey;
Color bodyBackgroundColor = const Color(0xFFF2F2F2);
Color appbarColor = const Color(0xFFcf564a);
Color primaryColor = const Color(0xFFcf564a);

/* ------------------------------- sized boxes ------------------------------ */

Widget size5 = SizedBox(
  width: 5.w,
  height: 5.h,
);

Widget size10 = SizedBox(
  width: 10.w,
  height: 10.h,
);

Widget size15 = SizedBox(
  width: 15.w,
  height: 15.h,
);

Widget size16 = SizedBox(
  width: 16.w,
  height: 16.h,
);
Widget size18 = SizedBox(
  width: 18.w,
  height: 18.h,
);

Widget size20 = SizedBox(
  width: 20.w,
  height: 20.h,
);

Widget size25 = SizedBox(
  width: 25.w,
  height: 25.h,
);

Widget size30 = SizedBox(
  width: 30.w,
  height: 30.h,
);

Widget size35 = SizedBox(
  width: 35.w,
  height: 35.h,
);

Widget size40 = SizedBox(
  width: 40.w,
  height: 40.h,
);

Widget size45 = SizedBox(
  width: 45.w,
  height: 45.h,
);

Widget size50 = SizedBox(
  width: 50.w,
  height: 50.h,
);

Widget size55 = SizedBox(
  width: 55.w,
  height: 55.h,
);

Widget size60 = SizedBox(
  width: 60.w,
  height: 60.h,
);

Widget size65 = SizedBox(
  width: 65.w,
  height: 65.h,
);
Widget size80 = SizedBox(
  width: 80.w,
  height: 80.h,
);
Widget size100 = SizedBox(
  width: 100.w,
  height: 100.h,
);
Widget size150 = SizedBox(
  width: 150.w,
  height: 150.h,
);
Widget size230 = SizedBox(
  width: 230.w,
  height: 230.h,
);
