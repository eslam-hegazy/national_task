import 'package:get/get.dart';
import 'package:national_task/features/home/controllers/favourite_controller.dart';
import 'package:national_task/features/home/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(FavoriteController(), permanent: true);
  }
}
