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
  Future<void> updateStatus(TodayTask task) async {
    final newStatus = task.status == "Completed" ? "Pending" : "Completed";
    final success = await repo.updateStatus(
      UpdateStatus(status: newStatus, id: task.id),
      task.id,
    );
    if (success == true) {
      task.status = newStatus;
      item.refresh();
    } else {
      Get.snackbar("Error", "Failed to update task status");
    }
  }
}
