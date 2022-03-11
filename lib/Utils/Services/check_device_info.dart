import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoAPI {
  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static String getOperatingSystem() {
    return Platform.operatingSystem;
  }

  static String getScreenResolution() {
    return "${window.physicalSize.width} X ${window.physicalSize.height}";
  }

  static Future<String> getPhoneInfo() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return "${info.manufacturer} - ${info.model}";
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return "${info.name} - ${info.model}";
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getPhoneVersion() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      print(info);
      return info.version.sdkInt.toString();
    } else if (Platform.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      // print(info);
      return info.systemVersion.toString();
    } else {
      throw UnimplementedError();
    }
  }
}
