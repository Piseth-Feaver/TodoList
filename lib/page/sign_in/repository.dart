import 'package:todo_list/core/export.dart';
import 'model.dart';

class SignInRepository extends BaseRepository{
  Future<SignInResponse?>signIn(SingRequest request) async {
    final response = await post('/users/login', request.toJson());
    final data = await checkError(response);
    if (data == null) return null;
    return SignInResponse.fromJson(data);

  }
}
