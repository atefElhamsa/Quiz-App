// ignore_for_file: no_logic_in_create_state, void_checks
import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/core/utils/app_texts.dart';
import 'package:quizapp/features/home/data/models/question_model.dart';
import '../../../correct_answers/views/custom_check_answers.dart';

class CustomResultDialog extends StatefulWidget {
  const CustomResultDialog({
    super.key,
    required this.score,
    required this.length,
    required this.questions,
    required this.click,
    required this.close,
  });

  final int score;
  final int length;
  final List<QuestionModel> questions;
  final void Function()? click;
  final void Function()? close;

  @override
  State<CustomResultDialog> createState() =>
      _CustomResultDialogState(score, length, click, close, questions);
}

class _CustomResultDialogState extends State<CustomResultDialog> {
  int score;
  int length;
  List<QuestionModel> questions;
  void click;
  void close;
  _CustomResultDialogState(
      this.score, this.length, this.click, this.close, this.questions);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: widget.close,
            icon: const Icon(Icons.close),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.03),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.sizeOf(context).width * 0.03,
                      ),
                      border: Border.all(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTexts.result,
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height * 0.04,
                            fontWeight: FontWeight.w700,
                            color: AppColors.containerResult,
                          ),
                        ),
                        Text(
                          "${widget.score}/${widget.length}",
                          style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).height * 0.03,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CheckAnswerScreen(questions: questions);
                          }),
                        );
                      });
                    },
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: MediaQuery.sizeOf(context).width * 0.004,
                        ),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width * 0.03,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppTexts.check,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.sizeOf(context).height * 0.02,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  InkWell(
                    onTap: widget.click,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.sizeOf(context).width * 0.03,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppTexts.retest,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: MediaQuery.sizeOf(context).height * 0.02,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
