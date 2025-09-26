import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  Future<String?> getUUID() async {
    String? identifier;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        const androidIdPlugin = AndroidId();
        identifier = await androidIdPlugin.getId(); //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      debugPrint('Failed to get platform version');
      return 'Can not detect the device';
    }
    return identifier;
  }
}
