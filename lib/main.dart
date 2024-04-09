import 'package:flutter/material.dart';
import 'package:quizapp/features/home/views/widgets/custom_check_answer.dart';

void main(){
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckAnswer(),
    );
  }
}
