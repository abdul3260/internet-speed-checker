import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:interspeed/Utils/styles.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Center(
              child: Column(
            children: [
              header(),
              verticalSpace(20.h),
              Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return historyItem(index);
                    }),
              ),
              verticalSpace(12.h),
              simpleButton(
                buttonColor: Colors.red,
                btnText: "Clear",
                textColor: color_white,
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      alignment: Alignment.center,
      height: Get.height / 7.2,
      width: double.infinity,
      decoration: boxDecorationBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headingItem(
            headingTitle: "Network",
            widget: Icon(Icons.wifi, color: color_white, size: 30.r),
          ),
          headingItem(
            headingTitle: "Date",
            widget: simpleText(
              text: "2022-03-20",
              fontsize: 10.sp,
            ),
          ),
          headingItem(
            headingTitle: "Downlaod",
            widget: simpleText(
              text: "2.9 mbps",
              fontsize: 10.sp,
            ),
          ),
          headingItem(
            headingTitle: "Uplaod",
            widget: simpleText(
              text: "3.6 mbps",
              fontsize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget headingItem({required String headingTitle, required Widget widget}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          simpleText(
            text: headingTitle,
            fontweight: FontWeight.bold,
            fontsize: 14.sp,
          ),
          widget,
        ],
      ),
    );
  }

  Widget historyItem(index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 6.w),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildNetworkName(),
          buildDateAndTime(),
          buildDownloadSpeed(),
          buildUploadSpeed(),
        ],
      ),
    );
  }

  Widget buildNetworkName() {
    return Expanded(flex: 1, child: simpleText(text: "MOTO G5", fontsize: 14.sp, fontweight: FontWeight.bold, maxlines: 2));
  }

  Widget buildDateAndTime() {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          simpleText(
            text: "2022-3-20",
            fontsize: 12.sp,
          ),
          simpleText(
            text: "10.30 pm",
            fontsize: 10.sp,
          ),
        ],
      ),
    );
  }

  Widget buildDownloadSpeed() {
    return Expanded(
        flex: 1,
        child: simpleText(
          text: "MOTO G5",
          fontsize: 12.sp,
          maxlines: 1,
        ));
  }

  Widget buildUploadSpeed() {
    return Expanded(flex: 1, child: simpleText(text: "MOTO G%", fontsize: 12.sp));
  }
}
