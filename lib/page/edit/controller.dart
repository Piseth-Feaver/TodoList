import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/export.dart';
import 'package:todo_list/page/edit/repository.dart';

final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
final DateFormat timeFormat = DateFormat("HH:mm:ss");

class EditController extends GetxController {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final selectedDate = DateTime.now().obs;
  final startTime = TimeOfDay.now().obs;
  final endTime = TimeOfDay.now().obs;
  final repo = Get.find<EditRepository>();

  @override
  void onInit() {
    super.onInit();
    fetchDetail(Get.arguments);
  }

  Future<void> onUpdate(int id) async {
    final request = EditResponse(
      name: nameController.text.trim(),
      description: descriptionController.text.trim(),
      date: dateFormat.format(selectedDate.value),
      startTime: timeFormat.format(
        DateTime(
          selectedDate.value.year,
          selectedDate.value.month,
          selectedDate.value.day,
          startTime.value.hour,
          startTime.value.minute,
        ),
      ),
      endTime: timeFormat.format(
        DateTime(
          selectedDate.value.year,
          selectedDate.value.month,
          selectedDate.value.day,
          endTime.value.hour,
          endTime.value.minute,
        ),
      ),
    );
    final result = await repo.editTask(request, id);
    if (result == null) return;
    Get.back(result: true);
    Get.offAllNamed(HomeRoute.home);
  }

  Future<void> pickStartTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: startTime.value,
    );
    if (picked != null) {
      startTime.value = picked;
    }
  }

  Future<void> pickEndTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (picked != null) {
      endTime.value = picked;
    }
  }

  Future<void> fetchDetail(int id) async {
    final task = await repo.getTaskById(id);
    if (task != null) {
      nameController.text = task.name;
      descriptionController.text = task.description;
      selectedDate.value = DateTime.parse(task.date);
      final start = DateFormat("HH:mm:ss").parse(task.startTime);
      final end = DateFormat("HH:mm:ss").parse(task.endTime);
      startTime.value = TimeOfDay(hour: start.hour, minute: start.minute);
      endTime.value = TimeOfDay(hour: end.hour, minute: end.minute);
    }
  }
}
