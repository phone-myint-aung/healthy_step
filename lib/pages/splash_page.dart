import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/pages/onboard_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Healthy Step",
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/AppLogo.png'),
        nextScreen: OnboardPage(),
        backgroundColor: customBackgroundColor,
        splashTransition: SplashTransition.rotationTransition,
        centered: true,
        splashIconSize: 180,
      ),
    );
  }
}