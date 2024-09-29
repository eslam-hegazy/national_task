import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_task/core/utils/app_colors.dart';
import 'package:national_task/features/home/controllers/favourite_controller.dart';

class FavouriteScreen extends StatelessWidget {
   FavouriteScreen({super.key});
  final FavoriteController controller = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Question"),
      ),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (_, index) {
            final question = controller.favoriteQuestions[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(question.id),
              ),
              subtitle: Text(question.question),
              trailing: IconButton(
                onPressed: () {
                  controller.toggleFavorite(question);
                },
                icon: Icon(
                  Icons.favorite,
                  color: controller.questions[index].isFavorite
                      ? AppColors.redColor
                      : AppColors.greyColor,
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => const Divider(),
          itemCount: controller.favoriteQuestions.length,
        ),
      ),
   
    );
  }
}