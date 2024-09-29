import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_task/core/routes/app_routes.dart';
import 'package:national_task/core/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.rSplashScreen,
      getPages: routes,
      navigatorKey: Get.key,
      defaultTransition: Transition.topLevel,
    );
  }
}
