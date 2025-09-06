import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/background.dart';
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
        appBar: AppBar(
          title: Text(controller.item.value?.name ?? "Detail Task"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: kPadding, right: kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: controller.selectedDate.value,
                  selectedDayPredicate: (day) => isSameDay(day, controller.selectedDate.value),
                  onDaySelected: (selectedDay, focusedDay) {
                    controller.selectedDate.value = selectedDay;
                  },
                )),
                SizedBox(height: kSpace),
                Obx(() {
                  final items = controller.item.value;
                  if (items == null) return SizedBox();
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        AppCard(
                          left: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items.name),
                              ],
                            ),
                          ),
                        ),
                        AppCard(
                          left: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items.description),
                              ],
                            ),
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
                                        formatStartTime(items.startTime),
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
                                        formatEndTime(items.endTime),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                  );

                }),
                AppButton(
                  onPressed: () {
                    final items = controller.item.value;
                    if (items == null) return;
                    Get.toNamed(HomeRoute.edit, arguments: items.id);
                  },
                  child: Text(
                    "Edit Task",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                AppButton(
                  onPressed: () {},
                  child: Text(
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
