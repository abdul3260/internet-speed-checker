import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interspeed/Controllers_GetX/controller_speed_test.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interspeed/Utils/styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

final controller = Get.put(ControllerSpeedTest());
customSnackBar({required String title, required String content, IconData? icon}) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: color_snackbar_background,
    colorText: color_black,
    snackPosition: SnackPosition.BOTTOM,
    icon: Icon(icon),
  );
}

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget horizontalLine(margin) {
  return Container(
    height: 1,
    color: Colors.white38,
    margin: EdgeInsets.symmetric(horizontal: margin),
  );
}

Widget roundIcon(IconData icon) {
  return Container(
    alignment: Alignment.center,
    width: 42.w,
    height: 42.h,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: color_white,
      ),
    ),
    child: Icon(
      icon,
      color: color_white,
      size: 21.h,
    ),
  );
}

customDialog({
  required String title,
  required String content,
  required String buttonCancelText,
  String? buttonOkText,
  VoidCallback? onclickBtnCancel,
  VoidCallback? onclickBtnOk,
  required DialogType dialogType,
}) {
  var context = Get.context;
  return AwesomeDialog(
    btnOkColor: color_background,
    btnCancelColor: color_background,
    context: context!,
    animType: AnimType.SCALE,
    dialogType: dialogType,
    body: Center(
      child: Text(
        content,
        style: const TextStyle(
          fontFamily: "varela",
        ),
      ),
    ),
    title: title,
    desc: 'This is also Ignored',
    btnOkOnPress: onclickBtnOk,
    btnCancelOnPress: onclickBtnCancel,
    btnCancelText: buttonCancelText,
    btnOkText: buttonOkText,
  ).show();
}

Widget meterWidget() {
  return SfRadialGauge(
    animationDuration: 3000,
    enableLoadingAnimation: true,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 100,
        axisLabelStyle: const GaugeTextStyle(
          color: Colors.white,
        ),
        ranges: <GaugeRange>[GaugeRange(startValue: 0, endValue: 33, color: Colors.red, startWidth: 10, endWidth: 10), GaugeRange(startValue: 33, endValue: 66, color: Colors.yellow, startWidth: 10, endWidth: 10), GaugeRange(startValue: 66, endValue: 100, color: Colors.green, startWidth: 10, endWidth: 10)],
        pointers: <GaugePointer>[
          NeedlePointer(
            value: 50,
            animationDuration: 1000,
            enableAnimation: true,
            needleColor: color_white,
            animationType: AnimationType.bounceOut,
          )
        ],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: simpleText(text: "50 Mbps"),
            angle: 90,
            positionFactor: 0.8,
          )
        ],
      ),
    ],
  );
}

Widget customDrawer() {
  return Drawer(
    backgroundColor: color_background,
    child: Column(
      children: [
        verticalSpace(120.h),
        SizedBox(
          width: 130.w,
          height: 130.h,
          child: Image.asset("images/meter.png"),
        ),
        verticalSpace(62.h),
        horizontalLine(20.w),
        draweritem(icon: Icons.star_border_outlined, title: "Rate Us"),
        horizontalLine(20.w),
        draweritem(icon: Icons.lock_clock_outlined, title: "Privacy Policy"),
        horizontalLine(20.w),
        draweritem(icon: Icons.add, title: "More Apps"),
        horizontalLine(20.w),
        draweritem(icon: Icons.share, title: "Share App"),
        horizontalLine(20.w),
      ],
    ),
  );
}

Widget draweritem({
  required IconData icon,
  required String title,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 26.h, horizontal: 20.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        roundIcon(icon),
        horizontalSpace(20.w),
        simpleText(text: title),
      ],
    ),
  );
}

Widget simpleButton({
  required Color buttonColor,
  required String btnText,
  required Color textColor,
  onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: simpleText(text: btnText, textColor: textColor, fontweight: FontWeight.bold),
    ),
  );
}

Widget customBottomNavBar() {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(
        30.r,
      ),
      topLeft: Radius.circular(30.r),
    ),
    child: Obx(
      () => BottomNavigationBar(
        currentIndex: controller.indexBottomNavBar.value,
        selectedItemColor: color_white,
        unselectedItemColor: color_grey,
        selectedLabelStyle: TextStyle(
          fontFamily: "poppins",
          color: color_white,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "poppins",
          color: color_white,
        ),
        backgroundColor: color_darkblue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Info",
          ),
        ],
        onTap: (index) {
          controller.indexBottomNavBar.value = index;
        },
      ),
    ),
  );
}
