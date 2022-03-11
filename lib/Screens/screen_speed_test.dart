import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interspeed/Controllers_GetX/controller_speed_test.dart';
import 'package:interspeed/Utils/Services/chech_internet_connection.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:interspeed/Utils/styles.dart';
import 'package:interspeed/constants.dart';

class ScreenSpeedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 240.w,
                  height: 240.h,
                  child: meterWidget(),
                ),
                verticalSpace(20.h),
                simpleText(text: "Internet Speed", fontsize: 22.sp, fontweight: FontWeight.bold),
                simpleText(text: "Meter", fontsize: 22.sp, fontweight: FontWeight.bold),
                verticalSpace(38.h),
                recordsSection(),
                verticalSpace(48.h),
                simpleButton(buttonColor: color_green, btnText: "Let's Go", textColor: color_white),
                verticalSpace(16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recordsSection() {
    return Container(
      width: Get.width / 1.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          info(title: "Download", unit: "Mbps", value: "2.3"),
          info(title: "Upload", unit: "Mbps", value: "2.3"),
          info(title: "Percentage", unit: "Complete", value: "2.3"),
        ],
      ),
    );
  }

  Widget info({required String title, required String unit, required String value}) {
    return Expanded(
      child: Column(
        children: [
          simpleText(
            text: title,
            fontsize: 12.sp,
          ),
          verticalSpace(20.h),
          simpleText(
            text: value,
            fontsize: 22.sp,
          ),
          simpleText(
            text: "$unit %",
            fontsize: 14.sp,
          ),
        ],
      ),
    );
  }
}
