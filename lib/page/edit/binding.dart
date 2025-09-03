import 'package:get/get.dart';
import 'export.dart';

class EditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> EditController());
  }
}