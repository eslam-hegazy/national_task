// models/question_model.dart
import 'package:get/get.dart';

class Question {
  final String id;
  final String question;
  RxBool isFavorite;

  Question({
    required this.id,
    required this.question,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'isFavorite': isFavorite.value, // Access value for saving
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String,
      question: map['question'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }
}
