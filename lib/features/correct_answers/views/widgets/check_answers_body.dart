import 'package:flutter/material.dart';
import '../../../home/data/models/question_model.dart';
import 'check_answer_item_widget.dart';

class CheckAnswersBody extends StatelessWidget {
  const CheckAnswersBody({super.key, required this.questions});
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.06),
      child: ListView(
        children: [
          ...questions.map(
            (questionModel) => CustomCheckAnswerItemWidget(
              questionModel: questionModel, questions: questions,
            ),
          ),
        ],
      ),
    );
  }
}
