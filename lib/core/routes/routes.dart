import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:national_task/core/bindings/splash_binding.dart';
import 'package:national_task/core/routes/app_routes.dart';
import 'package:national_task/features/home/screens/home_screen.dart';
import 'package:national_task/features/splash/screen/splash_screen.dart';

List<GetPage> routes = [
  GetPage(
    name: AppRoutes.rSplashScreen,
    binding: SplashBinding(),
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.rHomeScreen,
    page: () => HomeScreen(),
  ),
];
