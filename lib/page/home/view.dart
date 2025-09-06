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
          appBar: AppBar(title: const Text('Welcome Lonh Piseth')),
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
                      Text("Progress", style: Get.textTheme.titleLarge),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                  AppCard(
                    left: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Daily Task", style: Get.textTheme.titleMedium),
                        Text(
                          "2/3 Task Completed",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "You are almost done go ahead",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Today's Task", style: Get.textTheme.titleLarge),
                      Text(
                        "See All",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
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
                            await Get.toNamed(HomeRoute.detail, arguments: i.id,);
                            controller.fetchTodayTasks();
                          },
                          child: AppCard(
                            left: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(i.name, style: TextStyle(fontSize: 16)),
                                const SizedBox(height: 6),
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
                                const SizedBox(height: kSpace),
                                Text("Status: ${i.status}"),
                              ],
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
