import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/helper/alert.dart';
import '../../route/home.dart';
import 'model.dart';
import 'repository.dart';

class DetailController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final focusedDate = DateTime.now().obs;
  final calendarFormat = CalendarFormat.month.obs;
  final confirmController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  final item = Rxn<DetailRequest>();
  final repo = Get.find<DetailRepository>();
  late final int taskId;

  @override
  void onInit() {
    taskId = Get.arguments as int;
    fetchDetail(taskId);
    super.onInit();
  }

  Future<void> fetchDetail(int id) async {
    final tasks = await repo.getFeedBack(taskId);
    if (tasks != null) {
      selectedDate.value = DateTime.parse(tasks.date);
      item.value = tasks;
    }
  }

  Future<void> onConfirm() async {
    final result = await repo.deleteTask(taskId);
    if (result) {
      AlertHelper.success("Success");
      Get.offAllNamed(HomeRoute.home);
    }
  }

  bool isSelectedDay(DateTime day) {
    return isSameDay(selectedDate.value, day);
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedDate.value = selectedDay;
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