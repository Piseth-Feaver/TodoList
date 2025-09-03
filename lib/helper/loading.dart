import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoadingService {
  static show() {
    Get.context!.loaderOverlay.show();
  }

  static void hide() {
    Get.context!.loaderOverlay.hide();
  }
}
