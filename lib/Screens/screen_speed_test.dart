import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interspeed/Screens/home.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:interspeed/Utils/styles.dart';

class ScreenSpeedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 240.w,
                    height: 240.h,
                    child: meterWidget(
                      min: 0,
                      max: 15,
                      needleValue: controller.needleValue.value,
                      title: controller.meterTitle.toString(),
                    ),
                  ),
                  verticalSpace(20.h),
                  simpleText(text: "Internet Speed", fontsize: 22.sp, fontweight: FontWeight.bold),
                  simpleText(text: "Meter", fontsize: 22.sp, fontweight: FontWeight.bold),
                  verticalSpace(38.h),
                  recordsSection(),
                  verticalSpace(48.h),
                  simpleButton(
                      buttonColor: controller.isTesting.value ? color_grey : color_green,
                      btnText: "Let's Go",
                      textColor: color_white,
                      onTap: controller.isTesting.value
                          ? null
                          : () {
                              controller.checkInternetDownlaodingSpeed(context);
                              print("Hello");
                            }),
                  verticalSpace(16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget recordsSection() {
    var percent = "%";
    return Container(
      width: Get.width / 1.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          info(title: "Download", unit: "Mbps", value: controller.downStreamProgress.toStringAsFixed(2)),
          info(title: "Upload", unit: "Mbps", value: controller.upStreamProgress.toStringAsFixed(2)),
          info(title: "Percentage", unit: "Complete $percent", value: controller.percentage.toStringAsFixed(1)),
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
            text: "$unit",
            fontsize: 14.sp,
          ),
        ],
      ),
    );
  }
}
