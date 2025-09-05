import 'package:get/get.dart';
import 'package:todo_list/page/edit/repository.dart';
import 'export.dart';

class EditBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> EditRepository());
    Get.lazyPut(()=> EditController());
  }
}