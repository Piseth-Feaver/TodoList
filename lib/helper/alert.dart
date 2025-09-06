import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

class AlertHelper {
  static void showAlert(String message) {
    toastification.show(
      type: ToastificationType.info,
      title: Text("Alert"),
      description: Text(message),
      autoCloseDuration: Duration(seconds: 3),
    );
  }
  static void success(String message) {
    toastification.show(
      type: ToastificationType.info,
      title: Text("Success"),
      description: Text(message),
      autoCloseDuration: Duration(seconds: 3),
    );
  }
  static void error(String message) {
    toastification.show(
      type: ToastificationType.info,
      title: Text("Error"),
      description: Text(message),
      autoCloseDuration: Duration(seconds: 3),
    );
  }
}