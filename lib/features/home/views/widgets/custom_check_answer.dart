import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';
import 'package:quizapp/core/utils/app_texts.dart';
import 'package:quizapp/core/widgets/app_bar_widget.dart';
import 'package:quizapp/features/home/views/widgets/custom_home_divider.dart';
import '../../data/models/question_model.dart';

class CheckAnswer extends StatelessWidget {
  const CheckAnswer({super.key, required this.questions});

  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.11,
        flexibleSpace: CustomAppBar(name: AppTexts.checkAnswer),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.025),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.sizeOf(context).width * 0.05,
                      bottom: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    child: Text(
                      "(${index + 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        color: AppColors.numberOfCheckAnswer,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.sizeOf(context).width * 0.1,
                      bottom: MediaQuery.sizeOf(context).height * 0.015,
                    ),
                    child: Text(
                      questions[index].question,
                      style: TextStyle(
                        fontSize: MediaQuery.sizeOf(context).height * 0.02,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                CustomHomeDivider(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${questions[index].answers}"),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.05,
                ),
                Divider(
                  thickness: MediaQuery.sizeOf(context).width * 0.005,
                  color: AppColors.primaryColor.withOpacity(0.3),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          );
        },
        itemCount: questions.length,
      ),
    );
  }
}
