import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_task/features/home/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentScreenIndex.value,
          onTap: (index) {
            controller.currentScreenIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourites",
            ),
          ],
        ),
      ),
      body:Obx(()=>controller.screens[controller.currentScreenIndex.value],),
    );
  }
}
