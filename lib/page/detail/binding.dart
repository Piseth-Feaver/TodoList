import 'package:get/get.dart';
import 'package:todo_list/page/detail/repository.dart';
import 'export.dart';
class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DetailRepository());
    Get.lazyPut(()=> DetailController());
  }
}