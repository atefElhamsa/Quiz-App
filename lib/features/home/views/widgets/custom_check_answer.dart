import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_texts.dart';
import 'package:quizapp/core/widgets/app_bar_widget.dart';

class CheckAnswer extends StatelessWidget {
  const CheckAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.11,
        flexibleSpace: CustomAppBar(name: AppTexts.checkAnswer),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
