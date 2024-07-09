class Question {
  final String id;
  final String question;
  final Map<String, bool> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
