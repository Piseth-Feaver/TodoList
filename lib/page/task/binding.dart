import 'package:get/get.dart';
import 'export.dart';
import 'repository.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateTaskRepository());
    Get.lazyPut(()=> TaskController());
  }
}