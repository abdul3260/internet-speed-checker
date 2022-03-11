import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';
import 'package:interspeed/Screens/screen_history.dart';
import 'package:interspeed/Screens/screen_info.dart';
import 'package:interspeed/Screens/screen_speed_test.dart';
import 'package:interspeed/Utils/Services/chech_internet_connection.dart';
import 'package:interspeed/Utils/external_widgets.dart';

class ControllerSpeedTest extends GetxController {
  final CheckInternetConnection connection = CheckInternetConnection();
  // var istimerCompleted = false.obs;
  var unit = "Mbps".obs;
  var upStream = "0".obs;
  var downStream = "0".obs;
  var upStreamProgress = "0".obs;
  var downStreamProgress = "0".obs;
  var upstreamError = "".obs;
  var downstreamError = "".obs;
  var isTesting = false.obs;
  var isInternetEnabled = false.obs;
  var indexBottomNavBar = 0.obs;
  final internetSpeedTest = InternetSpeedTest();
  final keyScaffold = GlobalKey<ScaffoldState>();

  List allScreens = [
    ScreenSpeedTest(),
    const ScreenHistory(),
    const ScreenInfo(),
  ];

  startSpeedTest() {
    if (connection.isInternetEnabled) {
      checkInternetDownlaodingSpeed();
    } else {
      customSnackBar(title: "Sorry", content: "No Internet Connection ");
    }
    //uploading Speed automatically starts when the downloading speed is once completed.
  }

  checkInternetUploadingSpeed() {
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate, the percent $percent');
      },
      onError: (String errorMessage, String speedTestError) {},
    );
  }

  checkInternetDownlaodingSpeed() {
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');
        checkInternetUploadingSpeed();
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate, the percent $percent');
      },
      onError: (String errorMessage, String speedTestError) {},
    );
  }

  String? getAppBarTitle() {
    if (indexBottomNavBar.value == 0) {
      return "Home";
    } else if (indexBottomNavBar.value == 1) {
      return "History";
    } else if (indexBottomNavBar.value == 2) {
      return "Network Info";
    } else {
      return null;
    }
  }
}
