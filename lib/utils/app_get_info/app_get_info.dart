import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info/package_info.dart';

Future<String> getOneSignalUserID() async {
  var status = await OneSignal.shared.getPermissionSubscriptionState();
  return status.subscriptionStatus.userId;
}

Future<String> getDeviceModel() async {
  String model = "";
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    model = androidInfo.model;
  } else {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    model = iosInfo.model;
  }
  return model;
}

Future<String> getDeviceBrand() async {
  String brand = "";
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    brand = androidInfo.brand;
  } else {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    brand = iosInfo.utsname.machine;
  }
  return brand;
}

Future<String> getDeviceVersion() async {
  String version = "";
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    version = androidInfo.version.release;
  } else {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    version = iosInfo.utsname.version;
  }
  return version;
}

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}
