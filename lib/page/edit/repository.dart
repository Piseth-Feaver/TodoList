import 'package:todo_list/core/repository.dart';
import 'model.dart';

class EditRepository extends BaseRepository {
  Future<EditRequest?> getFeedBack(int id) async {
    final response = await get('/getTak/$id');
    final data = await checkError(response);
    if (data == null) return null;
    return EditRequest.fromJson(data);
  }
  Future<EditResponse?> editTask(EditResponse request, int id) async {
    final response = await put('/updateTasks/$id', request.toJson());
    final data = await checkError(response);
    if (data == null) return null;
    return EditResponse.fromJson(data);
  }

}