import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/background.dart';
import 'package:todo_list/core/size.dart';
import 'package:todo_list/helper/card.dart';
import 'export.dart';

class EditView extends GetView<EditController> {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Task')),
        body: Padding(
          padding: const EdgeInsets.only(left: kPadding, right: kPadding),
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
              AppCard(left: Text("Mobile App Research")),
              SizedBox(height: kSpace),
              AppCard(
                left: Flexible(
                  child: Text(
                    "Mobile App Research: Based on food app and see user flow and find problem if any",
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
                      AppCard(
                        left: Row(
                          children: [
                            IconButton(
                              onPressed: () => controller.pickStartTime(context),
                              icon: Icon(Icons.access_time),
      
                            ),
                          ],
                        ),
                        right: Obx((){
                          return Text(
                            controller.startTime.value.format(context),
                          );
                        }),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("End Time", style: TextStyle(fontSize: 16),),
                      AppCard(
                        left: Row(
                          children: [
                            IconButton(
                              onPressed: () => controller.pickEndTime(context),
                              icon: Icon(Icons.access_time),
      
                            ),
                          ],
                        ),
                        right: Obx((){
                          return Text(
                            controller.endTime.value.format(context),
                          );
                        }),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: (){},
                  child: Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
