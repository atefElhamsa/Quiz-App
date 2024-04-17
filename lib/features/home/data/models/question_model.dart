class QuestionModel {
  String question;
  List<String> answers;
  String correctAnswer;
  String? selectedAnswer;
  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.selectedAnswer,
  });
}
