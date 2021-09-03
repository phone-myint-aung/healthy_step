import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

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
              GraphWithContainer(),
              GraphWithContainer(),
              GraphWithContainer(),
            ],
          ),
        ],
      ),
    );
  }
}

class GraphWithContainer extends StatelessWidget {
  const GraphWithContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Color(0xFF304878),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(
              'Monthly',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          GraphForReport(),
        ],
      ),
    );
  }
}

class GraphForReport extends StatelessWidget {
  const GraphForReport({
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
                  if(value % 4 == 0) return '$value';
                  else return ' ';
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
                  return '${value.toInt().toString()}k';
                },
                reservedSize: 20,
                margin: 8,
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Colors.white.withOpacity(.2),//Color(0xff37434d),
                width: 1,
              ),
            ),
            minX: 0,
            maxX: 23,
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
                        color: Colors.green, //barData.colors[0],
                        radius: 6,
                        strokeColor: Colors.green.withOpacity(.3),
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
                titleText: 'Time',
                reservedSize: 20,
                margin: 5,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              leftTitle: AxisTitle(
                showTitle: true,
                titleText: 'Steps',
                reservedSize: 5,
                margin: 5,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(1, 2),
                  FlSpot(2, 5),
                  FlSpot(3, 3.1),
                  FlSpot(4, 4),
                  FlSpot(5, 3),
                  FlSpot(6, 4),
                  FlSpot(7, 4),
                  FlSpot(8, 5)
                ],
                isCurved: true,
                colors: [
                  const Color(0xff23b6e6),
                  const Color(0xff02d39a),
                ],
                barWidth: 5,
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
