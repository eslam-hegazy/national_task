class Question {
  final String id;
  final String question;
  bool isFavorite;

  Question({required this.id, required this.question, this.isFavorite = false});

  Map<String, dynamic> toMap() {
    return {'id': id, 'question': question, 'isFavorite': isFavorite};
  }

  static Question fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      isFavorite: map['isFavorite'],
    );
  }
}
