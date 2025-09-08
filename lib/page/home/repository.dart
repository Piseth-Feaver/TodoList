import 'package:todo_list/core/export.dart';
import 'model.dart';

class TodayTaskRepository extends BaseRepository {
  Future<List<TodayTask>?> getTodayTask() async {
    final response = await get('/get/tasks');
    final data = await checkError(response);
    if (data == null) return null;
    return (data).map<TodayTask>((e) => TodayTask.fromJson(e))
        .toList();
  }
  Future<bool?> updateStatus(UpdateStatus request, int id) async {
    final response = await put('/tasks/status/${id}', request.toJson());
    final data = await checkError(response);
    if (data == null) return null;
    return true;
  }
}
