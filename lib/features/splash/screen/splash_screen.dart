import 'package:flutter/material.dart';
import 'package:national_task/core/utils/app_colors.dart';
import 'package:national_task/core/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Image.asset(AppImages.logoImage),
      ),
    );
  }
}
