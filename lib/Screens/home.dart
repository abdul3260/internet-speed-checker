import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interspeed/Controllers_GetX/controller_speed_test.dart';
import 'package:interspeed/Utils/Services/chech_internet_connection.dart';
import 'package:interspeed/Utils/colors.dart';
import 'package:interspeed/Utils/external_widgets.dart';
import 'package:interspeed/Utils/styles.dart';

final controller = Get.put(ControllerSpeedTest());

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final check_internet_connection = CheckInternetConnection();
  var subscription;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        check_internet_connection.checkInternetConnectionUsingConnectivityPlus(result);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.keyScaffold,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              controller.keyScaffold.currentState!.openDrawer();
            },
            child: const Icon(Icons.menu)),
        backgroundColor: color_background,
        elevation: 0,
        title: simpleText(
          text: controller.getAppBarTitle()!,
          fontweight: FontWeight.bold,
        ),
      ),
      backgroundColor: color_background,
      body: Obx(
        () => controller.allScreens[controller.indexBottomNavBar.value],
      ),
      drawer: customDrawer(),
      bottomNavigationBar: customBottomNavBar(),
    );
  }
}
