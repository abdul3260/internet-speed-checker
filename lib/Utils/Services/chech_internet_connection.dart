import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:flutter/material.dart';

class CheckInternetConnection {
  var connectionType = "Checking";
  var isInternetEnabled = false;

  Future checkInternetConnectionUsingConnectivityPlus(ConnectivityResult result) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (result == ConnectivityResult.mobile) {
      isInternetEnabled = true;
      connectionType = "Mobile Data";
      customSnackBar(title: "Good", content: "You are connected to Mobile Internet", icon: Icons.thumb_up_alt);
    } else if (result == ConnectivityResult.wifi) {
      isInternetEnabled = true;
      // I am connected to a wifi network.
      connectionType = "Wifi";
      customSnackBar(title: "Good", content: "You are connected to Wi-Fi", icon: Icons.thumb_up_alt);
    } else {
      isInternetEnabled = false;
      connectionType = "You are not Connected to the internet";
      customSnackBar(title: "Sorry", content: "You are not connected to the internet", icon: Icons.thumb_down_alt);
    }
  }
}
