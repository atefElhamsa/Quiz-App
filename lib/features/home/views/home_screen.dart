import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_texts.dart';
import 'package:quizapp/core/widgets/app_bar_widget.dart';
import 'package:quizapp/features/home/views/widgets/custom_home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.11,
          flexibleSpace: CustomAppBar(name: AppTexts.appName,
          ),
        ),
        body: CustomHomeBody(),
      ),
    );
  }
}
