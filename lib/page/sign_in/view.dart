import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/export.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: GestureDetector(
        onTap: () {
          Get.focusScope?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(title: Text("Sign In")),
          body: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(
                          'assets/images/todo-list.jpg',
                        ),
                      ),
                      SizedBox(height: kPadding * 3),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: kSpace * 2),
                            Column(
                              children: [
                                const SizedBox(height: kSpace),
                                AppTextForm(
                                  controller: controller.userNameController,
                                  label: "Username",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your username';
                                    }
                                    if (value.length < 4) {
                                      return 'Username must be at least 4 characters';
                                    }
                                    if (value.length > 20) {
                                      return 'Username must be less than 20 characters';
                                    }
                                    return null;
                                  },
                                ),
                                PasswordTextForm(
                                  controller: controller.passwordController,
                                ),
                                AppButton(
                                  onPressed: () {
                                    Get.toNamed(HomeRoute.home);
                                  },
                                  child: Text("Sign In", style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
