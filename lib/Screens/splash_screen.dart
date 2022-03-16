import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interspeed/Screens/home.dart';
import 'package:interspeed/Screens/screen_speed_test.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:interspeed/Utils/styles.dart';
import 'package:interspeed/constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    calculateScreenSize(context);
    moveToNextScreen();
    getPlatform();
    return Scaffold(
      backgroundColor: color_background,
      body: Container(
        // padding: EdgeInsets.all(16.h),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            simpleText(text: ""),
            meter(),
          ],
        ),
      ),
    );
  }

  calculateScreenSize(context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
  }

  moveToNextScreen() {
    Timer(
      const Duration(seconds: 5),
      () {
        // check_internet_connection.isInternetEnabled ? Get.off(const ScreenSpeedTest()) : customSnackBar(title: "Sorry", content: "No Internet Connection");
        Get.off(
          Home(),
        );
      },
    );
  }

  meter() {
    return Column(
      children: [
        SizedBox(
          width: Get.width / 1.7,
          height: Get.height / 1.8,
          child: meterWidgetStatic(),
        ),
        simpleText(
          text: "Internet",
          fontweight: FontWeight.bold,
          fontFamily: "varela",
          shadow: true,
        ),
        simpleText(
          text: "Speed Checker",
          fontweight: FontWeight.bold,
          fontFamily: "varela",
          shadow: true,
          textColor: Colors.white,
        ),
      ],
    );
  }

  getPlatform() {
    if (Platform.isAndroid) {
      platform = "android";
    } else {
      platform = "Ios";
    }
  }
}
