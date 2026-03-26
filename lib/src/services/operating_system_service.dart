import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/device_identity.dart';
import '../models/operating_system_info.dart';

import 'package:device_info_plus/device_info_plus.dart';

class OperatingSystemService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  Future<OperatingSystemInfo> getOperatingSystemInfo() async {
    if (kIsWeb) {
      final info = await _deviceInfo.webBrowserInfo;
      return OperatingSystemInfo(
        name: 'Web Browser',
        version: info.appVersion ?? 'Unknown Version',
        buildNumber: info.appVersion ?? 'Unknown Build Number',
        userAgent: info.userAgent ?? 'Unknown User Agent',
      );
    } else {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        return OperatingSystemInfo(
          name: 'Android',
          version: info.version.release,
          buildNumber: info.version.sdkInt.toString(),
        );
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        return OperatingSystemInfo(
          name: 'iOS',
          version: info.systemVersion,
          buildNumber: info.utsname.version,
        );
      } else if (Platform.isWindows) {
        final info = await deviceInfo.windowsInfo;
        return OperatingSystemInfo(
          name: 'Windows',
          version: info.displayVersion,
          buildNumber: info.buildNumber.toString(),
        );
      } else if (Platform.isMacOS) {
        final info = await deviceInfo.macOsInfo;
        return OperatingSystemInfo(
          name: 'macOS',
          version: info.osRelease,
          buildNumber: info.osRelease,
        );
      }
    }
    return OperatingSystemInfo(
      name: 'Unknown OS',
      version: 'Unknown Version',
      buildNumber: 'Unknown Build Number',
      userAgent: 'Unknown User Agent',
    );
  }

  Future<DeviceIdentity> getDeviceIdentity() async {
    if (kIsWeb) {
      final info = await _deviceInfo.webBrowserInfo;
      return DeviceIdentity(
        hardwareId: null,
        manufacturer: info.vendor,
        model: info.userAgent,
        deviceName: info.appName,
        brand: info.product,
      );
    }

    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return DeviceIdentity(
        hardwareId: info.fingerprint,
        brand: info.brand,
        model: info.model,
        manufacturer: info.manufacturer,
        deviceName: info.device,
      );
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return DeviceIdentity(
        hardwareId: info.identifierForVendor,
        brand: 'Apple',
        model: info.modelName,
        manufacturer: 'Apple',
        deviceName: info.name,
      );
    } else if (Platform.isWindows) {
      final info = await _deviceInfo.windowsInfo;
      return DeviceIdentity(
        hardwareId: info.deviceId,
        brand: null,
        model: info.productName,
        manufacturer: null,
        deviceName: info.computerName,
      );
    } else if (Platform.isMacOS) {
      final info = await _deviceInfo.macOsInfo;
      return DeviceIdentity(
        hardwareId: info.systemGUID,
        brand: 'Apple',
        model: info.modelName,
        manufacturer: 'Apple',
        deviceName: info.computerName,
      );
    }

    return const DeviceIdentity(
      hardwareId: null,
      brand: null,
      model: null,
      manufacturer: null,
      deviceName: null,
    );
  }

  Future<Map<String, dynamic>> getOperatingSystemInfoJson() async {
    final osInfo = await getOperatingSystemInfo();
    return osInfo.toJson();
  }

  Future<Map<String, dynamic>> getDeviceIdentityJson() async {
    final identity = await getDeviceIdentity();
    return identity.toJson();
  }
}
