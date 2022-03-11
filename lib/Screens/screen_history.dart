import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:interspeed/Utils/Services/chech_internet_connection.dart';
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
          padding: EdgeInsets.all(16.h),
          child: Center(
              child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 109.h,
                width: double.infinity,
                decoration: boxDecorationBorder(),
              ),
              verticalSpace(20.h),
              ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return historyItem(index);
                  }),
            ],
          )),
        ),
      ),
    );
  }

  Widget historyItem(index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
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
    return simpleText(text: "MOTO G%", fontsize: 16.sp, fontweight: FontWeight.bold);
  }

  Widget buildDateAndTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        simpleText(
          text: "2022-3-20",
          fontsize: 12.sp,
        ),
        simpleText(
          text: "10.30 pm",
          fontsize: 8.sp,
        ),
      ],
    );
  }

  Widget buildDownloadSpeed() {
    return simpleText(
      text: "MOTO G5",
      fontsize: 12.sp,
    );
  }

  Widget buildUploadSpeed() {
    return simpleText(text: "MOTO G%", fontsize: 12.sp);
  }
}
