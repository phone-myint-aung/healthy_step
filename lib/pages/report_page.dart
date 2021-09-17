import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/constants/colors.dart';
import 'package:healthy_step/models/daily_steps.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(18),
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              GraphWithContainer(
                titleText: 'Day',
                childWidget: GraphForWeek(),
              ),
              GraphWithContainer(
                titleText: 'Month',
                childWidget: GraphForMonth(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GraphWithContainer extends StatelessWidget {
  const GraphWithContainer({
    required this.titleText,
    required this.childWidget,
    Key? key,
  }) : super(key: key);
  final String titleText;
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Color(0xFF304878),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(
              titleText,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 8),
          childWidget,
        ],
      ),
    );
  }
}

class GraphForMonth extends StatelessWidget {
  const GraphForMonth({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.white.withOpacity(.2), //Color(0xff37434d),
                  strokeWidth: 1,
                  dashArray: [5, 10],
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.white.withOpacity(.2), //Color(0xff37434d),
                  strokeWidth: 1,
                  dashArray: [5, 10],
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white38, //Color(0xff68737d),
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return 'Aug\n7';
                    case 2:
                      return 'Aug\n14';
                    case 3:
                      return 'Aug\n21';
                    case 4:
                      return 'Aug\n27';
                  }
                  return '';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white38, //Color(0xff67727d),
                  //fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  if (value.toInt() > 0) {
                    return '${value.toInt().toString()}';
                  }
                  return ' ';
                },
                reservedSize: 10,
                margin: 8,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.white.withOpacity(.2), //Color(0xff37434d),
                width: 1,
              ),
            ),
            minX: 1,
            maxX: 4,
            minY: 0,
            maxY: 6,
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                tooltipBgColor: Colors.green.withOpacity(0.5),
                tooltipRoundedRadius: 20,
                getTooltipItems: (touchedSpots) =>
                    List<LineTooltipItem>.generate(
                  touchedSpots.length,
                  (index) => LineTooltipItem(
                    touchedSpots[index].y.toString(),
                    TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return List<TouchedSpotIndicatorData>.generate(
                  spotIndexes.length,
                  (_) => TouchedSpotIndicatorData(
                    FlLine(color: Colors.green.withOpacity(.3), strokeWidth: 3),
                    FlDotData(
                      getDotPainter: (spot, _, barData, index) =>
                          FlDotCirclePainter(
                        color: customGreenColor, //barData.colors[0],
                        radius: 6,
                        strokeColor: customGreenColor.withOpacity(.3),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
            axisTitleData: FlAxisTitleData(
              show: true,
              bottomTitle: AxisTitle(
                showTitle: true,
                titleText: 'Week',
                reservedSize: 20,
                margin: 18,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              leftTitle: AxisTitle(
                showTitle: true,
                titleText: 'Steps (km)',
                reservedSize: 5,
                margin: 5,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(1, 2),
                  FlSpot(2, 3),
                  FlSpot(3, 2),
                  FlSpot(4, 1),
                ],
                isCurved: true,
                colors: [
                  const Color(0xff23b6e6),
                  const Color(0xff02d39a),
                ],
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: [
                    const Color(0xff23b6e6),
                    const Color(0xff02d39a),
                  ].map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GraphForWeek extends StatefulWidget {
  const GraphForWeek({
    Key? key,
  }) : super(key: key);

  @override
  State<GraphForWeek> createState() => _GraphForWeekState();
}

class _GraphForWeekState extends State<GraphForWeek> {
  late Box<DailyStep> stepBox;
  late int selectedDate;
  @override
  void initState() {
    stepBox = Hive.box<DailyStep>('StepBox');
    super.initState();
  }

  String getTodayDate() {
    final today = DateTime.now();
    final day = (today.day < 10) ? '0${today.day}' : '${today.day}';
    final month = (today.month < 10) ? '0${today.month}' : '${today.month}';
    return '${today.year}' + month + day;
  }

  @override
  Widget build(BuildContext context) {
    selectedDate = (int.parse(getTodayDate()) - 7);
    return Expanded(
      child: Container(
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.white.withOpacity(.2), //Color(0xff37434d),
                  strokeWidth: 1,
                  dashArray: [5, 10],
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.white.withOpacity(.2), //Color(0xff37434d),
                  strokeWidth: 1,
                  dashArray: [5, 10],
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white38,
                  fontSize: 16,
                ),
                getTitles: (value) {
                  final int _date = selectedDate % 100;
                  // TODO: fill all
                  return '${_date + value.toInt()}';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTextStyles: (context, value) => const TextStyle(
                  color: Colors.white38,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  if (value.toInt() > 0) {
                    return '${value.toInt().toString()}';
                  }
                  return ' ';
                },
                reservedSize: 10,
                margin: 8,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.white.withOpacity(.2), //Color(0xff37434d),
                width: 1,
              ),
            ),
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 6,
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                tooltipBgColor: Colors.green.withOpacity(0.5),
                tooltipRoundedRadius: 20,
                getTooltipItems: (touchedSpots) =>
                    List<LineTooltipItem>.generate(
                  touchedSpots.length,
                  (index) => LineTooltipItem(
                    touchedSpots[index].y.toString(),
                    TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return List<TouchedSpotIndicatorData>.generate(
                  spotIndexes.length,
                  (_) => TouchedSpotIndicatorData(
                    FlLine(color: Colors.green.withOpacity(.3), strokeWidth: 3),
                    FlDotData(
                      getDotPainter: (spot, _, barData, index) =>
                          FlDotCirclePainter(
                        color: customGreenColor, //barData.colors[0],
                        radius: 6,
                        strokeColor: customGreenColor.withOpacity(.3),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                );
              },
            ),
            axisTitleData: FlAxisTitleData(
              show: true,
              bottomTitle: AxisTitle(
                showTitle: true,
                titleText: 'Day',
                reservedSize: 20,
                margin: 8,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              leftTitle: AxisTitle(
                showTitle: true,
                titleText: 'Steps (k)',
                reservedSize: 5,
                margin: 5,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(7, (index) {
                  // TODO: change date key
                  final userDailyStep = stepBox.get(selectedDate + index,
                      defaultValue: DailyStep()..step = 0) as DailyStep;
                  return FlSpot(index.toDouble(), userDailyStep.step / 1000);
                }),
                isCurved: true,
                colors: [
                  const Color(0xff23b6e6),
                  const Color(0xff02d39a),
                ],
                barWidth: 4,
                curveSmoothness: 0.001,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  colors: [
                    const Color(0xff23b6e6),
                    const Color(0xff02d39a),
                  ].map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
