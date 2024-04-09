import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.name});

  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(MediaQuery.sizeOf(context).width * 0.06,),
          bottomRight: Radius.circular(MediaQuery.sizeOf(context).width * 0.06,),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: AppColors.white,
          fontSize: MediaQuery.sizeOf(context).height * 0.03,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
