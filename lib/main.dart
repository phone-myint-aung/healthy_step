import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/models/daily_steps.dart';
import 'package:healthy_step/models/user_model.dart';
import 'package:healthy_step/pages/splash_page.dart';
import 'package:healthy_step/router/router.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserNameAdapter());
  Hive.registerAdapter(DailyStepAdapter());
  await Hive.openBox<UserName>('NameBox');
  await Hive.openBox<DailyStep>('StepBox');
  runApp(SplashPage());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: customBackgroundColor,
        scaffoldBackgroundColor: customBackgroundColor,
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}