import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/export.dart';
import 'export.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: AppBackground(
        child: Scaffold(
          appBar: AppBar(title: const Text('Edit Task')),
          body: Padding(
            padding: const EdgeInsets.only(left: kPadding, right: kPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: controller.focusedDate.value,
                      calendarFormat: controller.calendarFormat.value,
                      selectedDayPredicate: (day) => controller.isSelectedDay(day),
                      onDaySelected: controller.onDaySelected,
                      onFormatChanged: controller.onFormatChanged,
                    ),
                  ),
                  SizedBox(height: kSpace),
                  Text("Schedule", style: TextStyle(fontSize: 18)),
                  Obx(() {
                    final result = controller.item.value;
                    if (result == null) return SizedBox();
                    return Column(
                      children: [
                        TextFormField(
                          initialValue: result.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: kSpace),
                        TextFormField(
                          initialValue: result.description,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
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
                                        onPressed: () {
                                          controller.pickStartTime(context);
                                        },
                                        icon: Icon(Icons.access_time_outlined),
                                      ),
                                      right: Text(
                                        formatStartTime(result.startTime),
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
                                        onPressed: () {
                                          controller.pickEndTime(context);
                                        },
                                        icon: Icon(Icons.access_time_outlined),
                                      ),
                                      right: Text(
                                        formatEndTime(result.endTime),
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
                  AppButton(
                    onPressed: (){},
                    child: Text("Update Task",style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
