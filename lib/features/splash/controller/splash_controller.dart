import 'package:get/get.dart';
import 'package:national_task/core/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _navigate();
    super.onInit();
  }

  // splash navigation
  void _navigate() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(AppRoutes.rHomeScreen);
    });
  }
}
