import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_task/core/utils/app_colors.dart';
import 'package:national_task/features/home/controllers/favourite_controller.dart';
import 'package:national_task/features/home/models/question_model.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});
  final controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions"),
      ),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (_, index) {
            final question = controller.questions[index];
            return _customQuestionItem(question, context);
          },
          separatorBuilder: (_, index) => const Divider(),
          itemCount: controller.questions.length,
        ),
      ),
    );
  }

  Widget _customQuestionItem(Question question, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(question.id),
      ),
      subtitle: Text(question.question),
      trailing: Obx(() {
        return IconButton(
          onPressed: () {
            controller.toggleFavorite(question: question, context: context);
          },
          icon: Icon(
            Icons.favorite,
            color: question.isFavorite.value
                ? AppColors.redColor
                : AppColors.greyColor,
          ),
        );
      }),
    );
  }
}
