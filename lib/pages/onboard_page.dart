import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/main.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 36,
      color: Colors.white,
    );
    const bodyTextStyle = TextStyle(
      fontSize: 24,
      color: Colors.white,
    );
    const pageDecoration = PageDecoration(
      imageAlignment: Alignment.topCenter,
      imagePadding: EdgeInsets.all(0),
      imageFlex: 3,
      bodyFlex: 2,
    );
    return Scaffold(
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
          activeSize: Size.square(12),
          activeColor: customBlueColor,
          color: customContainerColor,
        ),  
        controlsMargin: EdgeInsets.only(bottom: 30),
        showSkipButton: true,
        showDoneButton: true,
        showNextButton: false,
        color: Colors.white,
        skip: Text('Skip', style: TextStyle(fontSize: 22)),
        done: Text('Continue', style: TextStyle(fontSize: 22)),
        globalBackgroundColor: customBackgroundColor,
        onSkip: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp())),
        onDone: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp())),
        pages: [
          PageViewModel(
            decoration: pageDecoration,
            image: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'images/onboard1.png',
                fit: BoxFit.fill,
              ),
            ),
            titleWidget: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Welcome',
                style: titleTextStyle,
              ),
            ),
            bodyWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Walking is the best exercise.\nKeep walking and keep smiling.',
                textAlign: TextAlign.left,
                style: bodyTextStyle,
              ),
            ),
          ),
          PageViewModel(
            decoration: pageDecoration,
            image: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'images/onboard2.png',
                fit: BoxFit.fill,
              ),
            ),
            titleWidget: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Healthy Meals',
                style: titleTextStyle,
              ),
            ),
            bodyWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'See what food include in diet meals and lets start eating healthy meals for your health.',
                textAlign: TextAlign.left,
                style: bodyTextStyle,
              ),
            ),
          ),
          PageViewModel(
            decoration: pageDecoration,
            image: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'images/onboard3.png',
                fit: BoxFit.fill,
              ),
            ),
            titleWidget: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Welcome',
                style: titleTextStyle,
              ),
            ),
            bodyWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Walking is the best exercise.\nKeep walking and keep smiling.',
                textAlign: TextAlign.left,
                style: bodyTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}