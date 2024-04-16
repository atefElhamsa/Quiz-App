import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import '../../../home/data/models/question_model.dart';
import '../../../home/views/widgets/custom_home_divider.dart';

class CustomCheckAnswerItemWidget extends StatelessWidget {
  const CustomCheckAnswerItemWidget({super.key, required this.questionModel});

  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "(${questionModel.numberQuestion}",
          style: TextStyle(
            color: AppColors.numberOfCheckAnswer,
            fontWeight: FontWeight.w700,
            fontSize: MediaQuery.sizeOf(context).height * 0.02,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width * 0.04,
          ),
          child: Text(
            questionModel.question,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
                fontSize: MediaQuery.sizeOf(context).height * 0.023),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        const CustomHomeDivider(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        Wrap(
          children: [
            ...questionModel.answers.map(
              (answer) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  answer,
                  style: TextStyle(
                      color: questionModel.correctAnswer == answer
                          ? AppColors.correctAnswer
                          : questionModel.correctAnswer !=
                                      questionModel.selectedAnswer &&
                                  questionModel.selectedAnswer == answer
                              ? AppColors.wrongAnswer
                              : AppColors.grey,
                      fontSize: MediaQuery.sizeOf(context).height * 0.02),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.015,
        ),
        const Divider(),
      ],
    );
  }
}
