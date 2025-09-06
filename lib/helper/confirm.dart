import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> confirmDialog(String message) async {
  final result = await Get.dialog<bool>(
    AlertDialog(
      title: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: true);
          },
          child: Text(
            "Yes",
            style: TextStyle(
              color: Get.theme.colorScheme.error,
            ),
          ),
        ),
      ],
    ),
  );
  return result == true;
}