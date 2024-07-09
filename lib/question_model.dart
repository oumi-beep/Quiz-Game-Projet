class Question {
  final String id;
  final String title;
  final Map<String, bool> options;
  final String question;
  final String correctAnswer;

  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.question,
    required this.correctAnswer,
  });

  @override
  String toString() {
    return 'Question(id: $id, title: $title, options: $options, question: $question, correctAnswer: $correctAnswer)';
  }
}
