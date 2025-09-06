import 'package:get/get.dart';
import 'package:todo_list/page/home/export.dart';
import 'package:todo_list/page/home/repository.dart';
import '../../core/storage.dart';

class HomeController extends GetxController {
  final item = RxList<TodayTask>();
  final repo = Get.find<TodayTaskRepository>();
  final storage = Get.find<StorageService>();
  String get username => storage.username ?? "Unknown";


  @override
  void onInit()  {
    fetchTodayTasks();
    super.onInit();
  }
  Future<void> fetchTodayTasks() async {
    final tasks = await repo.getTodayTask();
    if (tasks != null) {
      item.assignAll(tasks);
    }
  }
}
