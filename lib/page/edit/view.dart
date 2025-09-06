import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/export.dart';
import '../../core/time.dart';
import 'export.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: AppBackground(
        child: Scaffold(
          appBar: AppBar(title: const Text('Edit Task')),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: controller.selectedDate.value,
                      selectedDayPredicate:
                          (day) =>
                              isSameDay(day, controller.selectedDate.value),
                      onDaySelected: (selectedDay, focusedDay) {
                        controller.selectedDate.value = selectedDay;
                      },
                    ),
                  ),
                  const SizedBox(height: kSpace),
                  const Text("Schedule", style: TextStyle(fontSize: 18)),

                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: kSpace),
                  TextFormField(
                    controller: controller.descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => AppTimePicker(
                            label: "Start Time",
                            time: controller.startTime.value,
                            onTap: () => controller.pickStartTime(context),
                          ),
                        ),
                      ),
                      const SizedBox(width: kSpace),
                      Expanded(
                        child: Obx(
                          () => AppTimePicker(
                            label: "End Time",
                            time: controller.endTime.value,
                            onTap: () => controller.pickEndTime(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppButton(
                    onPressed: () => controller.onUpdate(Get.arguments),
                    child: const Text(
                      "Update Task",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
