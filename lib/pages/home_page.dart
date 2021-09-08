import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/constants/custom_icons.dart';
import 'package:pedometer/pedometer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isStart = false;
  late Stream<StepCount> _stepCountStream;
  String steps = '0';
  @override
  void initState() {
    initPedometer();
    super.initState();
  }

  // TODO: Pedometer
  void initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  void onStepCount(event) {
    print(event.steps);
    setState(() {
      steps = event.steps.toString();
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      steps = '0';
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
                    CircleAvatar(
                      radius: 25,
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
                          value: double.parse(steps),
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
                          value: double.parse(steps),
                        ),
                      ],
                      annotations: [
                        GaugeAnnotation(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                steps,
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
                        CustomIcons.distance, customBlueColor, "1.82", "km"),
                    ContainerWithThreeText(
                        CustomIcons.calorie, Color(0xFFFF9641), "824", "kcal"),
                    ContainerWithThreeText(
                        CustomIcons.time, customRedColor, "1h 20m", "kcal"),
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
