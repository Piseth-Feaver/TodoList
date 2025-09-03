import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class DeviceService extends GetxService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  final version = "".obs;
  final deviceId = "".obs;

  @override
  Future<void> onInit() async {
    version.value = await _getVersion();
    deviceId.value = await _getDeviceId() ?? "";
    super.onInit();
  }

  Future<String?> _getDeviceId() async {
    if (GetPlatform.isAndroid) {
      var androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (GetPlatform.isIOS) {
      var iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    } else {
      return null;
    }
  }

  Future<String> _getVersion() async {
    if (GetPlatform.isAndroid) {
      var androidInfo = await _deviceInfo.androidInfo;
      androidInfo.version.release;
    }
    if (GetPlatform.isIOS) {
      var iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    }
    return "";
  }
}
