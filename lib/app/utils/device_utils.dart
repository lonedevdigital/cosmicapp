import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  static Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id ?? androidInfo.androidId ?? 'unknown_android';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? 'unknown_ios';
    } else {
      return 'unknown_device';
    }
  }
}

extension on AndroidDeviceInfo {
  get androidId => null;
}
