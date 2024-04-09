import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/features/home/data/models/question_model.dart';
import 'package:quizapp/features/home/views/widgets/custom_result_dialog.dart';
import 'package:quizapp/features/home/views/widgets/custom_home_divider.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_texts.dart';

class CustomHomeBody extends StatefulWidget {
  CustomHomeBody({super.key});

  @override
  State<CustomHomeBody> createState() => _CustomHomeBodyState();
}

class _CustomHomeBodyState extends State<CustomHomeBody> {
  List<QuestionModel> questions = [
    QuestionModel(
      question: "أفضل لاعب ف التاريخ",
      answers: ["Cristiano Ronaldo", "Lionel Messi", "Neymar JR", "Halland"],
      correctAnswer: "Cristiano Ronaldo",
      selectedAnswer: null,
    ),
    QuestionModel(
      question: "أحسن معلق ف التاريخ",
      answers: ["الشوالى", "حفيظ الدراجى", "فارس عوض", "ايمن الكاشف"],
      correctAnswer: "الشوالى",
      selectedAnswer: null,
    ),
    QuestionModel(
      question: "كم من الكرات الذهبية مع افضل لاعب بالتاريخ",
      answers: ["1", "2", "3", "6"],
      correctAnswer: "6",
      selectedAnswer: null,
    ),
    QuestionModel(
      question: "كم من الكرات الذهبية مع ليونيل ميسى",
      answers: ["5", "1", "10", "8"],
      correctAnswer: "8",
      selectedAnswer: null,
    ),
    QuestionModel(
      question: "افضل كلية فى مصر",
      answers: ["حاسبات و معلومات", "هندسة", "اداب", "حقوق"],
      correctAnswer: "حاسبات و معلومات",
      selectedAnswer: null,
    ),
  ];

  int questionIndex = 0;
  int score = 0;
  plusQuestionIndex() {
    if (questionIndex < questions.length - 1) {
      if (questions[questionIndex].selectedAnswer != null) {
        setState(() {
          questionIndex += 1;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("choose one answer"),
          ),
        );
      }
    } else {
      checkAnswer();
      showDialog(
          context: context,
          builder: (context) {
            return CustomResultDialog(
              score: score,
              length: questions.length,
              click: () {
                score = 0;
                questionIndex = 0;
                changeSelectedAnswerToNull();
                Navigator.pop(context);
                setState(() {});
              },
              close: () {
                score = 0;
                Navigator.pop(context);
                setState(() {});
              },
            );
          });
    }
  }

  checkAnswer() {
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].correctAnswer == questions[i].selectedAnswer) {
        score += 1;
      }
    }
  }

  changeSelectedAnswerToNull() {
    for (int i = 0; i < questions.length; i++) {
      questions[i].selectedAnswer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width * 0.09,
          ),
          child: Align(
            child: Text(
              questions[questionIndex].question,
              style: GoogleFonts.almarai(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: MediaQuery.sizeOf(context).height * 0.025,
              ),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        CustomHomeDivider(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.01,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return RadioListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.07,
              ),
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  MediaQuery.sizeOf(context).height * 0.025,
                ),
              ),
              activeColor: AppColors.primaryColor,
              value: questions[questionIndex].answers[index],
              groupValue: questions[questionIndex].selectedAnswer,
              onChanged: (value) {
                setState(() {
                  questions[questionIndex].selectedAnswer = value;
                });
              },
              title: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "${questions[questionIndex].answers[index]}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.03,
            );
          },
          itemCount: questions[questionIndex].answers.length,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.01,
        ),
        CustomHomeDivider(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.025,
        ),
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  MediaQuery.sizeOf(context).width * 0.02,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          ),
          onPressed: () {
            plusQuestionIndex();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1,
            ),
            child: Text(
              questionIndex == questions.length - 1
                  ? AppTexts.send
                  : AppTexts.next,
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
        ),
        Text(
          "(${questionIndex + 1}/${questions.length})",
          style: TextStyle(
            color: Color(0XFF615D5D),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
