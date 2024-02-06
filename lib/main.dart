import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:skeleton/app/controllers/network_controller.dart';

import 'app/routes/app_pages.dart';
import 'config/color_constants.dart';

void main() {
  initializeDateFormatting();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: kPrimaryTheme,
      defaultTransition: Transition.cupertino,
      initialBinding: InitialBinding(),
    ),
  );
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }
}
