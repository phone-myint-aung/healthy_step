import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/main.dart';
import 'package:healthy_step/pages/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isOnboardScreen = true;
  late final prefs;
  @override
  void initState() {
    super.initState();
    getBoolOnBoardScreen();
  }

  Future<void> getBoolOnBoardScreen() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isOnboardScreen = prefs.getBool('isOnboardScreen') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Healthy Step",
       theme: ThemeData.dark().copyWith(
        primaryColor: customBackgroundColor,
        scaffoldBackgroundColor: customBackgroundColor,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/AppLogo.png'),
        nextScreen: (isOnboardScreen) ? OnboardPage() : MyApp(),
        backgroundColor: customBackgroundColor,
        splashTransition: SplashTransition.rotationTransition,
        centered: true,
        splashIconSize: 180,
      ),
    );
  }
}
