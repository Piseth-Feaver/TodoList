import 'package:get/get.dart';
import 'package:todo_list/core/export.dart';
import 'export.dart';
import 'repository.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DeviceService());
    Get.lazyPut(()=> StorageService());
    Get.lazyPut(()=> SignInRepository());
    Get.lazyPut(()=> SignInController());
  }
}