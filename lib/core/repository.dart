import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'export.dart';

class BaseRepository extends GetConnect {
  @protected
  late final String _path;

  final storage = Get.find<StorageService>();
  final device = Get.find<DeviceService>();


  @override
  void onInit() {
    httpClient.baseUrl = "http://192.168.0.236:5000";
    httpClient.timeout = const Duration(minutes: 2);
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer ${storage.token}';
      request.headers['Version'] = device.version.value;
      request.headers['DeviceId'] = device.deviceId.value;
      return request;
    });
    super.onInit();
  }
  @protected
  Future<dynamic> checkError(Response response, {dynamic data}) async {
    if (response.hasError) {
      // Handle unauthorized → retry
      if ([401, 403].contains(response.statusCode)) {
        if (response.request == null) {
          return Future.error("Cannot retry: original request missing");
        }
        final req = response.request!;
        final newPath = req.url.path.replaceFirst("/$_path", "");
        final res = await request(
          newPath,
          req.method,
          body: data,
          headers: req.headers,
        );
        return checkError(res);
      }

      // Build error message
      var message = response.statusText ?? "Unknown error";
      if (response.bodyString?.isNotEmpty ?? false) {
        message = response.bodyString!;
      }

      throw Exception(message);
    }

    return response.body ?? {};
  }



  // void _showErrorToast(String message) {
  //   toastification.show(
  //     context: Get.context!,
  //     type: ToastificationType.error,
  //     alignment: Alignment.topCenter,
  //     style: ToastificationStyle.flatColored,
  //     title: const Text("Oops.."),
  //     description: Text(message),
  //     autoCloseDuration: const Duration(seconds: 4),
  //     showProgressBar: false,
  //   );
  // }

/// TokenRepository handles token refresh
// class TokenRepository extends GetConnect {
//   final storage = Get.find<StorageService>();
//   final device = Get.find<DeviceService>();
  //
  // Future<bool> refreshToken() async {
  //   final response = await post(
  //     '${httpClient.baseUrl}/AnonymousUser/RefreshToken',
  //     {
  //       "accessToken": storage.token,
  //       "sub": device.deviceId.value,
  //     },
  //   );
  //
  //   if (response.hasError) {
  //     if (response.statusCode == 401) {
  //       storage.removeToken();
  //       Get.offAllNamed(HomeRoute.home);
  //       return false;
  //     }
  //     _showErrorToast(response.bodyString ?? response.statusText.toString());
  //     return false;
  //   }
  //
  //   storage.setToken(response.body);
  //   return true;
  // }

  // void _showErrorToast(String message) {
  //   toastification.show(
  //     context: Get.context!,
  //     type: ToastificationType.error,
  //     alignment: Alignment.topCenter,
  //     style: ToastificationStyle.flatColored,
  //     title: const Text("Oops.."),
  //     description: Text(message),
  //     autoCloseDuration: const Duration(seconds: 4),
  //     showProgressBar: false,
  //   );
  // }
}
