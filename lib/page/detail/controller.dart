import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'model.dart';
import 'repository.dart';

class DetailController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final focusedDate = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  final item = Rxn<DetailRequest>();
  final repo = Get.find<DetailRepository>();

  @override
  void onInit() {
    fetchDetail(Get.arguments);
    super.onInit();
  }
  Future<void> fetchDetail(int id) async {
    final tasks = await repo.getFeedBack(id);
    if (tasks != null) {
      selectedDate.value = DateTime.parse(tasks.date);
      item.value = tasks;
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
    if (pickedTime != null && pickedTime != startTime.value) {
      startTime.value = pickedTime;
    }
  }
  Future<void> pickEndTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (pickedTime != null && pickedTime != endTime.value) {
      endTime.value = pickedTime;
    }
  }
}