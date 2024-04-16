class QuestionModel {
  String question;
  String numberQuestion;
  List<String> answers;
  String correctAnswer;
  String? selectedAnswer;
  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.selectedAnswer,
    required this.numberQuestion,
  });
}
