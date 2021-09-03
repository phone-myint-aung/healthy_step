import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/constants/custom_icons.dart';
import 'package:healthy_step/router/router.gr.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.black,
                      ),
                      Icon(
                        CustomIcons.photo,
                        color: customGreenColor,
                        size: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Steven',
                        style: TextStyle(fontSize: 36),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(FormRoute());
                        },
                        child: Icon(
                          CustomIcons.edit,
                          size: 40,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 100),
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF304878),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weight:',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 15),
                  Text(
                    '100',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        'kg',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(FormRoute());
                        },
                        child: Icon(
                          CustomIcons.edit,
                          size: 40,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 100),
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF304878),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Height:',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 15),
                  Text(
                    '100',
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(FormRoute());
                        },
                        child: Icon(
                          CustomIcons.edit,
                          size: 40,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(height: 250),
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Color(0xFF304878),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'BMI',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '24.5',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Healthy',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 16),
                      BmiGraph(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiGraph extends StatelessWidget {
  const BmiGraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: 10,
      maximum: 40,
      showLabels: false,
      showAxisTrack: false,
      showTicks: true,
      ranges: [
        LinearGaugeRange(
          startValue: 10,
          endValue: 18.5,
          midWidth: 35,
          endWidth: 35,
          color: Colors.amber,
        ),
        LinearGaugeRange(
          startValue: 18.5,
          endValue: 30,
          midWidth: 35,
          endWidth: 35,
          color: Colors.green,
        ),
        LinearGaugeRange(
          startValue: 25,
          endValue: 30,
          midWidth: 35,
          endWidth: 35,
          color: Colors.orange,
        ),
        LinearGaugeRange(
          startValue: 30,
          endValue: 40,
          midWidth: 35,
          endWidth: 35,
          color: Colors.red,
        ),
      ],
      markerPointers: [
        LinearWidgetPointer(
          value: 20,
          child: Container(
            width: 7,
            height: 50,
            color: Colors.white54,
          ),
          position: LinearElementPosition.outside,
        ),
        LinearWidgetPointer(
          value: 20,
          child: Container(
            width: 7,
            height: 15,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }
}
