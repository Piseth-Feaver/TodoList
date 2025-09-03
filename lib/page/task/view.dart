import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/background.dart';
import 'package:todo_list/core/export.dart';
import 'package:todo_list/export.dart';
import 'package:todo_list/helper/card.dart';
import 'export.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: GestureDetector(
        onTap: () {
          Get.focusScope?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Create New Task"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // or use kPadding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: controller.focusedDate.value,
                      calendarFormat: controller.calendarFormat.value,
                      selectedDayPredicate:
                          (day) => controller.isSelectedDay(day),
                      onDaySelected: controller.onDaySelected,
                      onFormatChanged: controller.onFormatChanged,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Schedule", style: TextStyle(fontSize: 18)),
                        const SizedBox(height: kPadding),
                        TextFormField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            labelText: "Task Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter a task name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: kPadding),
                        TextFormField(
                          controller: controller.descriptionController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            labelText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Please enter a description";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: kPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Start Time
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Start Time",
                                  style: TextStyle(fontSize: 16),
                                ),
                                AppCard(
                                  left: IconButton(
                                    onPressed:
                                        () => controller.pickStartTime(context),
                                    icon: const Icon(
                                      Icons.access_time_outlined,
                                    ),
                                  ),
                                  right: Obx(() {
                                    return Text(
                                      controller.startTime.value.format(
                                        context,
                                      ),
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "End Time",
                                  style: TextStyle(fontSize: 16),
                                ),
                                AppCard(
                                  left: IconButton(
                                    onPressed:
                                        () => controller.pickEndTime(context),
                                    icon: const Icon(Icons.access_time),
                                  ),
                                  right: Obx(() {
                                    return Text(
                                      controller.endTime.value.format(context),
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        AppButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.createTask();
                            }
                          },
                          child: const Text(
                            "Create Task",
                            style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
