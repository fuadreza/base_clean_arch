import 'dart:io';

import 'package:base_clean_arch/main.dart';
import 'package:device_info_plus/device_info_plus.dart';

final DeviceInfoService deviceInfoService = DeviceInfoService.instance;

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService();

  static DeviceInfoService get instance => _instance;

  AndroidDeviceInfo? get androidDeviceInfo => _androidDeviceInfo;

  IosDeviceInfo? get iosDeviceInfo => _iosDeviceInfo;

  AndroidDeviceInfo? _androidDeviceInfo;
  IosDeviceInfo? _iosDeviceInfo;
  MacOsDeviceInfo? _macOsDeviceInfo;

  Future<void> init() async {
    if (Platform.isAndroid) {
      _androidDeviceInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      try {
        _iosDeviceInfo = await deviceInfo.iosInfo;
      } catch (_) {}
    } else if (Platform.isMacOS) {
      try {
        _macOsDeviceInfo = await deviceInfo.macOsInfo;
      } catch (_) {}
    }
  }

  String getDeviceModel() {
    if (Platform.isAndroid) {
      return _androidDeviceInfo!.model;
    } else if (Platform.isIOS) {
      return _iosDeviceInfo!.model;
    } else if (Platform.isMacOS) {
      return _macOsDeviceInfo!.model;
    } else {
      return 'Unknown';
    }
  }

  String getDeviceBrand() {
    if (Platform.isAndroid) {
      return _androidDeviceInfo!.brand;
    } else if (Platform.isIOS) {
      return _iosDeviceInfo!.localizedModel;
    } else if (Platform.isMacOS) {
      return _macOsDeviceInfo!.model;
    } else {
      return 'Unknown';
    }
  }

  String getDeviceInfo() {
    if (Platform.isAndroid) {
      return '${_androidDeviceInfo!.brand} ${_androidDeviceInfo!.model}';
    } else if (Platform.isIOS) {
      return _iosDeviceInfo!.model;
    } else if (Platform.isMacOS) {
      return _macOsDeviceInfo!.model;
    } else {
      return 'Unknown';
    }
  }

  String? getDeviceIdentifier() {
    if (Platform.isAndroid) {
      return _androidDeviceInfo!.id;
    } else if (Platform.isIOS) {
      return _iosDeviceInfo!.identifierForVendor;
    } else if (Platform.isMacOS) {
      return _macOsDeviceInfo!.computerName;
    } else {
      return 'Unknown';
    }
  }
}
