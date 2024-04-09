import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/core/utils/app_images.dart';
import 'package:quizapp/features/home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.001),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  AppImages.up,
                ),
              ),
              Spacer(),
              ElasticIn(
                child: Image.asset(
                  AppImages.logo,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  AppImages.down,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
