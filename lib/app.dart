import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toastification/toastification.dart';
import 'package:todo_list/route/home.dart';

import 'core/device.dart';
import 'core/storage.dart';

Future<void> injectServices() async {
  await GetStorage.init();
  Get.put(DeviceService());
  Get.put(StorageService());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        initialRoute: HomeRoute.signIn,
        getPages: HomeRoute.routes,
      ),
    );
  }
}