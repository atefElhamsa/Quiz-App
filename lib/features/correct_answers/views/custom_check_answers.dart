import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_texts.dart';
import 'package:quizapp/core/widgets/app_bar_widget.dart';
import 'package:quizapp/features/correct_answers/views/widgets/check_answers_body.dart';
import '../../home/data/models/question_model.dart';

class CheckAnswerScreen extends StatelessWidget {
  const CheckAnswerScreen(
      {super.key, required this.questions});

  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.11,
        flexibleSpace: const CustomAppBar(
          name: AppTexts.checkAnswer,
        ),
      ),
      body: CheckAnswersBody(
        questions: questions,
      ),
    );
  }
}
