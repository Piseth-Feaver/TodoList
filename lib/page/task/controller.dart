import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/export.dart';
import 'package:todo_list/helper/alert.dart';
import 'repository.dart';

class TaskController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final focusedDate = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  final repo = Get.find<CreateTaskRepository>();

  Future<void> createTask() async {
    if (formKey.currentState == null || !formKey.currentState!.validate()) {
      return;
    }
    Get.focusScope?.unfocus();

    final request = CreateTaskRequest(
      taskName: nameController.text.trim(),
      description: descriptionController.text.trim(),
      date: selectedDate.value,
      startTime: DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        startTime.value.hour,
        startTime.value.minute,
      ),
      endTime: DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        endTime.value.hour,
        endTime.value.minute,
      ),
    );

    final result = await repo.createTask(request);
    if (result != null) {
      AlertHelper.success("Create task successfully");
      Get.offAllNamed(HomeRoute.home);
      Get.back(result: true);
    } else {
      AlertHelper.error("Create task failed");
    }
  }


  bool isSelectedDay(DateTime day) {
    return isSameDay(selectedDate.value, day);
  }
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedDate.value = selectedDay;
    focusedDate.value = focusedDay;
  }

  void onFormatChanged(CalendarFormat format) {
    calendarFormat.value = format;
  }

  Future<void> pickStartTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: startTime.value,
    );
    if (pickedTime != null) {
      startTime.value = pickedTime;
    }
  }

  Future<void> pickEndTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (pickedTime != null) {
      endTime.value = pickedTime;
    }
  }
}
