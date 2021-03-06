import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interspeed/Utils/colors.dart';

simpleText({
  required String text,
  fontsize,
  fontweight,
  textColor,
  fontFamily,
  shadow = false,
  maxlines,
}) {
  return Text(
    text,
    style: TextStyle(
      // fontFamily: ,
      fontSize: fontsize ?? 18.sp,
      fontWeight: fontweight ?? FontWeight.normal,
      color: textColor ?? color_white,
      fontFamily: fontFamily ?? "poppins",
      shadows: shadow
          ? const [
              Shadow(
                blurRadius: 6,
                offset: Offset(2, 2),
                color: Colors.black,
              ),
            ]
          : null,
    ),
    textAlign: TextAlign.center,
    maxLines: maxlines ?? 20,
  );
}

boxDecoration({buttonColor}) {
  return BoxDecoration(color: buttonColor ?? Colors.white, borderRadius: BorderRadius.circular(50.r), boxShadow: const [
    BoxShadow(
      color: Colors.black,
      spreadRadius: 4,
      blurRadius: 3,
    ),
  ]);
}

boxDecorationBorder({Color? borderColor, radius, backgroundColor}) {
  return BoxDecoration(
    color: backgroundColor ?? color_darkblue,
    border: Border.all(
      color: borderColor ?? Colors.white38,
    ),
    borderRadius: BorderRadius.circular(radius ?? 8.r),
  );
}
