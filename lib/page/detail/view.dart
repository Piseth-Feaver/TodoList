import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/background.dart';
import 'package:todo_list/core/color.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/helper/button.dart';
import 'package:todo_list/helper/card.dart';
import 'package:todo_list/helper/forma-time.dart';
import 'package:todo_list/route/home.dart';
import 'export.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(title: Text("Detail Task")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: kPadding, right: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: controller.selectedDate.value,
                    selectedDayPredicate:
                        (day) => isSameDay(day, controller.selectedDate.value),
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.selectedDate.value = selectedDay;
                    },
                  ),
                ),
                SizedBox(height: kSpace),
                Obx(() {
                  final i = controller.item.value;
                  if (i == null) return SizedBox();
                  return Column(
                    children: [
                      AppCard(
                        left: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(i.name, style: Get.textTheme.titleMedium),
                          ],
                        ),
                      ),
                      AppCard(
                        left: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(i.description, style: Get.textTheme.titleMedium),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Start Time", style: TextStyle(fontSize: 16),),
                              Row(
                                children: [
                                  AppCard(
                                    left: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.access_time_outlined),
                                    ),
                                    right: Text(
                                      formatStartTime(i.startTime),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("End Time",style: TextStyle(fontSize: 16),),
                              Row(
                                children: [
                                  AppCard(
                                    left: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.access_time_outlined),
                                    ),
                                    right: Text(
                                      formatEndTime(i.endTime),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  );
                }),
                SizedBox(height: kSpace * 2),
                AppButton(
                  onPressed: () {
                    final items = controller.item.value;
                    if (items == null) return;
                    Get.toNamed(HomeRoute.edit,arguments: items.id);
                  },
                  child: Text(
                    "Edit Task",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: kSpace),
                AppButton(
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: cardColor,
                      title: "Confirm Delete",
                      middleText: "Are you sure you want to delete this task?",
                      textCancel: "Cancel",
                      textConfirm: "Confirm",
                      confirmTextColor: Colors.white,
                      onConfirm: () async {
                        await controller.onConfirm();
                        Get.back();
                      },
                    );
                  },
                  child: const Text(
                    "Delete Task",
                    style: TextStyle(color: Colors.white),
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
