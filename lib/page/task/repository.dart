import 'package:todo_list/core/export.dart';
import 'model.dart';

class CreateTaskRepository extends BaseRepository{
  Future<CreateTaskResponse?> createTask(CreateTaskRequest request) async {
    final response = await post('/createTask', request.toJson());
    final data = await checkError(response);
    return CreateTaskResponse.fromJson(data!);
  }
}