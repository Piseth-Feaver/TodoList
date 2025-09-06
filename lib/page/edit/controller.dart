import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/page/edit/repository.dart';
import 'model.dart';

final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
final DateFormat timeFormat = DateFormat("HH:mm a");

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
    Get.back(result: true);
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
    final tasks = await repo.getFeedBack(id);
    if (tasks != null) {
      nameController.text = tasks.name;
      descriptionController.text = tasks.description;
      selectedDate.value = DateTime.parse(tasks.date);
      final start = DateFormat("HH:mm:ss").parse(tasks.startTime);
      final end = DateFormat("HH:mm:ss").parse(tasks.endTime);
      startTime.value = TimeOfDay(hour: start.hour, minute: start.minute);
      endTime.value = TimeOfDay(hour: end.hour, minute: end.minute);
    }
  }
}
