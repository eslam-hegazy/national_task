import 'package:get/get.dart';
import 'package:national_task/features/splash/controller/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(), permanent: true);
  }
}
