import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_colors.dart';

class CustomHomeDivider extends StatelessWidget {
  const CustomHomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.primaryColor,
      indent: MediaQuery.sizeOf(context).width * 0.15,
      endIndent: MediaQuery.sizeOf(context).width * 0.15,
      thickness: MediaQuery.sizeOf(context).height * 0.001,
    );
  }
}
