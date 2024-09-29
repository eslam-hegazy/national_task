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
  }

  void toggleFavorite(Question question) {
    question.isFavorite = !question.isFavorite;
    if (question.isFavorite) {
      favoriteQuestions.add(question);
    } else {
      favoriteQuestions.removeWhere((q) => q.id == question.id);
    }
    saveFavorites();
    questions.refresh();  // To update the UI immediately
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteList = favoriteQuestions.map((q) => q.toMap().toString()).toList();
    prefs.setStringList('favorites', favoriteList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoriteList = prefs.getStringList('favorites');
    if (favoriteList != null) {
      favoriteQuestions.assignAll(favoriteList.map((q) => Question.fromMap(q as Map<String, dynamic>)).toList());
    }
  }
}
