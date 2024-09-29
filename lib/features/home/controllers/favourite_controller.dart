import 'dart:convert'; // Import for JSON encoding and decoding
import 'package:get/get.dart';
import 'package:national_task/features/home/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  var questions = <Question>[].obs;
  var favoriteQuestions = <Question>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
    _loadQuestions(); // Load predefined questions
  }

  void _loadQuestions() {
    questions.assignAll([
      Question(id: '1', question: 'What is Flutter?'),
      Question(id: '2', question: 'Explain async and await in Dart.'),
      Question(id: '3', question: 'What is state management in Flutter?'),
      Question(id: '4', question: 'How does the Flutter widget tree work?'),
    ]);
  }

  void toggleFavorite(Question question) {
    question.isFavorite = !question.isFavorite;
    if (question.isFavorite) {
      favoriteQuestions.add(question);
    } else {
      favoriteQuestions.removeWhere((q) => q.id == question.id);
    }
    saveFavorites();
    questions.refresh(); // Refresh UI after the delay
    Get.snackbar(
      question.isFavorite ? 'Added to Favorites' : 'Removed from Favorites',
      question.question,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    // Convert each Question to JSON string before saving
    List<String> favoriteList =
        favoriteQuestions.map((q) => jsonEncode(q.toMap())).toList();
    prefs.setStringList('favorites', favoriteList);
  }

  void clearOldData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // This will clear all stored data
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoriteList = prefs.getStringList('favorites');

    if (favoriteList != null) {
      // Decode each JSON string back into a map and then to Question
      favoriteQuestions.assignAll(
        favoriteList.map((q) => Question.fromMap(jsonDecode(q))).toList(),
      );
    }
  }
}
