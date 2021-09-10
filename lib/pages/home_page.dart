import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/constants/custom_icons.dart';
import 'package:healthy_step/models/daily_steps.dart';
import 'package:healthy_step/router/router.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isStart = false;
  late Stream<StepCount> _stepCountStream;
  int todayStep = 0;
  late int _todayStep;
  late int totalSteps;
  late final prefs;
  late int savedDate;
  late Box<DailyStep> stepBox;
  @override
  void initState() {
    super.initState();
    startPrefences();
    stepBox = Hive.box<DailyStep>('StepBox');
    initPedometer();
  }

  // todo getprefs total steps
  Future<void> startPrefences() async {
    print('start preference');
    prefs = await SharedPreferences.getInstance();
    getTotalSteps();
    getSavedDate();
    _todayStep = prefs.getInt('todayStep') ?? 0;
    setState(() {
      todayStep = _todayStep;
    });
  }

  void getTodaySteps() {
    todayStep = prefs.getInt('todayStep') ?? 0;
  }

  void getTotalSteps() {
    totalSteps = prefs.getInt('totalSteps') ?? 0;
  }

  void getSavedDate() {
    savedDate = prefs.getInt('savedDate') ?? 20210906;
  }

  Future<void> setTodayStep(int steps) async {
    await prefs.setInt('todayStep', steps);
  }

  Future<void> setTotalSteps(int steps) async {
    await prefs.setInt('totalSteps', steps);
  }

  Future<void> setSavedDate(int date) async {
    await prefs.setInt('savedDate', date);
  }

  // TODO: use date time
  String getTodayDate() {
    final today = DateTime.now();
    final day = (today.day < 10) ? '0${today.day}' : '${today.day}';
    final month = (today.month < 10) ? '0${today.month}' : '${today.month}';
    return '${today.year}' + month + day;
  }

  void initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount, onError: _onErrorCounting);
  }

  // TODO: Pedometer listen function
  void onStepCount(StepCount event) {
    print('start counting');
    if (totalSteps > event.steps) {
      setTotalSteps(0);
      getTotalSteps();
    }
    // TODO: someLogic error
    if (int.parse(getTodayDate()) > savedDate) {
      print(int.parse(getTodayDate()) > savedDate);
      stepBox.put(savedDate, DailyStep()..step = event.steps - totalSteps);
      setTotalSteps(event.steps);
      setSavedDate(int.parse(getTodayDate()));
      setTodayStep(0);
      getTotalSteps();
      getTodaySteps();
      getSavedDate();
    }
    print(savedDate);
    setState(() {
      print(event.steps);
      print(totalSteps);
      print(todayStep);
      if (event.steps > 0) todayStep = event.steps - totalSteps;
    });
    setTodayStep(todayStep);
  }

  void _onErrorCounting(error) {
    setState(() {
      getTodaySteps();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Steven',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(MainRoute(pageIndex: 3));
                      },
                      child: CircleAvatar(
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SfRadialGauge(
                  animationDuration: 1000,
                  enableLoadingAnimation: true,
                  axes: [
                    RadialAxis(
                      minimum: 0,
                      maximum: 6000,
                      maximumLabels: 2,
                      labelOffset: 20,
                      startAngle: 130,
                      endAngle: 50,
                      labelsPosition: ElementsPosition.outside,
                      axisLineStyle: AxisLineStyle(
                        color:
                            Colors.white.withOpacity(.6), // Color(0xFFE5E5E5),
                        cornerStyle: CornerStyle.bothCurve,
                        thickness: 30,
                      ),
                      axisLabelStyle:
                          GaugeTextStyle(fontWeight: FontWeight.bold),
                      pointers: [
                        RangePointer(
                          width: 30,
                          value: todayStep.toDouble(),
                          cornerStyle: CornerStyle.startCurve,
                          color: customGreenColor,
                        ),
                        WidgetPointer(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: customGreenColor, width: 7),
                              color: Colors.white,
                            ),
                          ),
                          value: todayStep.toDouble(),
                        ),
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                todayStep.toString(),
                                style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Steps',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(height: 20),
                              Icon(
                                FontAwesomeIcons.running,
                                size: 60,
                              ),
                            ],
                          ),
                          positionFactor: 0.3,
                          angle: 90,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isStart = !isStart;
                  });
                  //TODO: step start count
                  // (isStart) ? initPedometer() : print('pause');
                },
                child: (isStart)
                    ? StartPauseButton(
                        Icons.pause, Colors.white.withOpacity(.6), 'Pause')
                    : StartPauseButton(
                        Icons.play_arrow, customBlueColor, 'Start'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerWithThreeText(
                        CustomIcons.distance,
                        customBlueColor,
                        '${((todayStep * 0.8)/1000).toStringAsPrecision(2)}',
                        "km"),
                    ContainerWithThreeText(
                        CustomIcons.calorie,
                        Color(0xFFFF9641),
                        '${(todayStep * 0.04).toStringAsPrecision(2)}',
                        "cal"),
                    ContainerWithThreeText(
                        CustomIcons.time, customRedColor, "1h 20m", "time"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartPauseButton extends StatelessWidget {
  const StartPauseButton(
    this.icon,
    this.backgroundColor,
    this.text, {
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 35,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: backgroundColor,
      ),
    );
  }
}

class ContainerWithThreeText extends StatelessWidget {
  const ContainerWithThreeText(this.icon, this.color, this.number, this.text);
  final IconData icon;
  final String number;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 140,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Color(0xFF304878),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              number,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
