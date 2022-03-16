import 'package:awesome_dialog/awesome_dialog.dart';
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
  var meterTitle = "Speed".obs;
  var needleValue = 0.0.obs;
  var upStream = 0.0.obs;
  var downStream = 0.0.obs;
  var upStreamProgress = 0.0.obs;
  var downStreamProgress = 0.0.obs;
  var upstreamError = "".obs;
  var downstreamError = "".obs;
  var isTesting = false.obs;
  var isInternetEnabled = false.obs;
  var indexBottomNavBar = 0.obs;
  // var upstreamPercent = 0.0.obs;
  // var downstreamPercent = 0.0.obs;
  var percentage = 0.0.obs;
  final internetSpeedTest = InternetSpeedTest();
  final keyScaffold = GlobalKey<ScaffoldState>();

  List allScreens = [
    ScreenSpeedTest(),
    const ScreenHistory(),
    ScreenInfo(),
  ];

  // startSpeedTest() {
  //   if (connection.isInternetEnabled) {
  //     checkInternetDownlaodingSpeed();
  //   } else {
  //     customSnackBar(title: "Sorry", content: "No Internet Connection ");
  //   }
  //   //uploading Speed automatically starts when the downloading speed is once completed.
  // }

  checkInternetUploadingSpeed(context) {
    internetSpeedTest.startUploadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');
        upStream.value = transferRate;
        meterTitle.value = "Speed";
        isTesting.value = false;

        succesDialog(context, downloadSpeed: downStream.toString(), uploadSpeed: upStream.toString());
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        meterTitle.value = "Checking \n Uploading Speed";
        print('the transfer rate $transferRate, the percent $percent');
        upStreamProgress.value = transferRate;
        needleValue.value = transferRate;
        percentage.value = percent;
      },
      onError: (String errorMessage, String speedTestError) {
        upstreamError.value = errorMessage + "  " + speedTestError;
        customDialog(title: "Error", content: downstreamError.value, buttonCancelText: "Ok", dialogType: DialogType.ERROR);
      },
    );
  }

  checkInternetDownlaodingSpeed(context) {
    isTesting.value = true;
    internetSpeedTest.startDownloadTesting(
      onDone: (double transferRate, SpeedUnit unit) {
        print('the transfer rate $transferRate');
        downStream.value = transferRate;
        meterTitle.value = "Speed";
        checkInternetUploadingSpeed(context);
      },
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        downStreamProgress.value = transferRate;
        print('the transfer rate $transferRate, the percent $percent');
        percentage.value = percent;
        needleValue.value = transferRate;
        meterTitle.value = "Checking \n Downloading Speed";
      },
      onError: (String errorMessage, String speedTestError) {
        downstreamError.value = errorMessage + "  " + speedTestError;
        customDialog(title: "Error", content: downstreamError.value, buttonCancelText: "Ok", dialogType: DialogType.ERROR);
      },
    );
  }

  String? getAppBarTitle() {
    if (indexBottomNavBar.value == 0) {
      return "Home";
    } else if (indexBottomNavBar.value == 1) {
      return "History";
    } else if (indexBottomNavBar.value == 2) {
      return "Info";
    } else {
      return null;
    }
  }
}
