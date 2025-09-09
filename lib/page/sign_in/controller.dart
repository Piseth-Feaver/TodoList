import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_list/page/sign_in/repository.dart';
import 'package:todo_list/route/home.dart';
import '../../core/storage.dart';
import 'model.dart';

class SignInController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final repo = Get.find<SignInRepository>();
  final storage = Get.find<StorageService>();

@override onInit() {
  if (storage.token !=  '') {
    Future.microtask(() => Get.offAllNamed(HomeRoute.home));
  }
  super.onInit();
}

  Future<void> signIn() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
    Get.focusScope?.unfocus();
    final request = SingRequest(
      username: userNameController.text.trim(),
      password: passwordController.text.trim(),
    );
    final result = await repo.signIn(request);
    if (result == null) return;
    await storage.setToken(result.accessToken);
    await storage.setUsername(result.username);
    Get.toNamed(HomeRoute.home);
  }
}
