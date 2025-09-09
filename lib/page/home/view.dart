import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/background.dart';
import 'package:todo_list/core/export.dart';
import 'package:todo_list/helper/card.dart';
import 'package:todo_list/helper/forma-time.dart';
import 'package:todo_list/route/home.dart';
import 'export.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: GestureDetector(
        onTap: () {
          Get.focusScope?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(text: "Welcome,", style: Get.textTheme.titleLarge),
                  TextSpan(text: controller.username, style: Get.textTheme.titleLarge?.copyWith(fontSize: 24)),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: kPadding, right: kPadding),
              child: Column(
                children: [
                  SearchBar(
                    backgroundColor: WidgetStatePropertyAll(cardColor),
                    leading: const Icon(Icons.search),
                    hintText: "Search Task",
                    trailing: const [Icon(Icons.filter_list)],
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: kPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Progress", style: Get.textTheme.titleMedium),
                    ],
                  ),
                  AppCard(
                    left: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Daily Task", style: Get.textTheme.titleMedium),
                        Text(
                          "Please complete your task as much as possible",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tasks", style: Get.textTheme.titleLarge),
                    ],
                  ),
                  SizedBox(height: kSpace),
                  Obx(() {
                    final items = controller.item;
                    if (items.isEmpty) {
                      return Center(child: Text("No tasks available"));
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final i = items[index];
                        return GestureDetector(
                          onTap: () async {
                            await Get.toNamed(
                              HomeRoute.detail,
                              arguments: i.id,
                            );
                            controller.fetchTodayTasks();
                          },
                          child: AppCard(
                            left: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(i.name, style: TextStyle(fontSize: 16)),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today, size: 16),
                                    const SizedBox(width: kSpace),
                                    Text(i.date),
                                    const SizedBox(width: kSpace),
                                    Text(formatStartTime(i.startTime)),
                                    const SizedBox(width: kSpace),
                                    Text(formatEndTime(i.endTime)),
                                  ],
                                ),
                                Text(
                                  "Status: ${i.status}",
                                  style: TextStyle(
                                    color:
                                        i.status == "Completed"
                                            ? Colors.green
                                            : Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            right: IconButton(
                              onPressed: () {
                                controller.updateStatus(i);
                              },
                              icon: Icon(
                                i.status == "Completed"
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: kSpace),
                      itemCount: items.length,
                    );
                  }),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: buttonColor,
            onPressed: () async {
              await Get.toNamed(HomeRoute.task);
              controller.fetchTodayTasks();
            },
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
