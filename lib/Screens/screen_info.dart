import 'package:flutter/material.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:interspeed/Utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interspeed/Controllers_GetX/controller_speed_test.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interspeed/Utils/styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScreenInfo extends StatelessWidget {
  ScreenInfo({Key? key}) : super(key: key);

  Map info = {
    "Network": "Huawai",
    "Network IP Addres": "192.168.28.19",
    "Network BSSID": "3023.3390.3903.9",
    "Network IPv6": "EAJu99",
    "Network Submask": "ddd.dk3",
    "Network Broadcast": "990.90.90.90",
    "Network Gateway": "323.323.323.4",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_background,
      body: Column(
           
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          simpleText(
            text: "Network Info",
            fontsize: 20.sp,
            fontweight: FontWeight.bold,
          ),
          infoitem(title: "Network", value: info["Network"]),
          infoitem(title: "Network IP Addres", value: info["Network IP Addres"]),
          infoitem(title: "Network BSSID", value: info["Network BSSID"]),
          infoitem(title: "Network IPv6", value: info["Network IPv6"]),
          infoitem(title: "Network Submask", value: info["Network Submask"]),
          infoitem(title: "Network Broadcast", value: info["Network Broadcast"]),
          infoitem(title: "Network Gateway", value: info["Network Gateway"]),
        ],
      ),
    );
  }

  Widget infoitem({
    required String title,
    required String value,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 26.h, horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          simpleText(text: title, fontsize: 14.sp),
          horizontalSpace(20.0),
          simpleText(text: value, fontsize: 14.sp),
        ],
      ),
    );
  }
}
