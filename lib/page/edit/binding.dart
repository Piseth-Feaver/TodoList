import 'package:get/get.dart';
import 'package:todo_list/core/export.dart';
import 'package:todo_list/page/edit/repository.dart';
import 'export.dart';

class EditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DeviceService());
    Get.lazyPut(()=> StorageService());
    Get.lazyPut(()=> EditRepository());
    Get.lazyPut(()=> EditController());
  }
}