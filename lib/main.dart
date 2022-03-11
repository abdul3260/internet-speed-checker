import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interspeed/Screens/home.dart';
import 'package:interspeed/Screens/screen_speed_test.dart';
import 'package:get/get.dart';
import 'package:interspeed/Screens/splash_screen.dart';
import 'package:interspeed/Utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inter Speed',
      theme: ThemeData(
        primaryColor: color_background,
      ),
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => Home(),
      ),
    );
  }
}
