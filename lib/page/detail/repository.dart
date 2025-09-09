import 'package:todo_list/core/export.dart';
import 'model.dart';

class DetailRepository extends BaseRepository {
  Future<DetailRequest?> getFeedBack(int id) async {
    final response = await get('/get/task/$id');
    final data = await checkError(response);
    if (data == null) return null;
    return DetailRequest.fromJson(data);
  }
  Future<bool>deleteTask(int id) async {
    final response = await delete('/delete/task/$id');
    final data = checkError(response);
    return true;
  }
}