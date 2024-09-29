import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_task/core/utils/app_colors.dart';
import 'package:national_task/features/home/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  var questions = <Question>[].obs; // List of all questions
  var favoriteQuestions = <Question>[].obs; // List of favorite questions

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
    loadFavorites();
  }

  // Load initial questions (could be from a DB or predefined)
  void loadQuestions() {
    var sampleQuestions = [
      Question(id: '1', question: "What is Flutter?"),
      Question(id: '2', question: "Explain GetX in Flutter."),
      Question(
          id: '3',
          question:
              "What is the difference between StatefulWidget and StatelessWidget?"),
      Question(id: '4', question: "How do you manage state in Flutter?"),
      Question(id: '5', question: "What are the lifecycle methods in Flutter?"),
      Question(
          id: '6',
          question:
              "Explain the difference between hot reload and hot restart."),
      Question(id: '7', question: "How do you handle navigation in Flutter?"),
      Question(id: '8', question: "What is a FutureBuilder in Flutter?"),
      Question(id: '9', question: "What is the pubspec.yaml file used for?"),
      Question(
          id: '10',
          question: "Explain the concept of InheritedWidget in Flutter."),
    ].obs;
    questions.assignAll(sampleQuestions);
  }

  // Load favorite questions from shared preferences
  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavorites = prefs.getString('favorites');
    if (savedFavorites != null) {
      List<String> favoriteIds = List<String>.from(json.decode(savedFavorites));

      // Clear favoriteQuestions list first
      favoriteQuestions.clear();

      // Update isFavorite in questions list based on saved favoriteIds
      for (var question in questions) {
        if (favoriteIds.contains(question.id)) {
          question.isFavorite.value = true; // Update isFavorite with .value
          favoriteQuestions.add(question); // Add to favorite list
        } else {
          question.isFavorite.value = false; // Update isFavorite with .value
        }
      }
    }
  }

  // Toggle favorite status
  void toggleFavorite(
      {required Question question, required BuildContext context}) async {
    question.isFavorite.value =
        !question.isFavorite.value; // Toggle with .value
    if (question.isFavorite.value) {
      favoriteQuestions.add(question);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${question.question} has been added to your favorites.",
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.blueColor,
        ),
      );
    } else {
      favoriteQuestions.removeWhere((q) => q.id == question.id);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${question.question} has been remove to favorites."),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.redColor,
        ),
      );
    }
    updateFavorites();
  }

  // Persist favorite questions to shared preferences
  Future<void> updateFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = favoriteQuestions.map((q) => q.id).toList();
    await prefs.setString('favorites', json.encode(favoriteIds));
  }
}
