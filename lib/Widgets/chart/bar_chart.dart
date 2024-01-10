import 'package:derm_aid/Data/chart_data/bar_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class BarChartCont extends StatelessWidget {
  const BarChartCont({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 125,
        minY: 75,alignment: BarChartAlignment.start,
        barGroups: barChartGroupData,
        titlesData: FlTitlesData(show: false),
        groupsSpace: 100,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false)
      )
    );
  }
}
