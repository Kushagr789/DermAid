

import 'package:derm_aid/Data/chart_data/pie_chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class PieChartCont extends StatelessWidget {
  const PieChartCont({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: pieChartSectionData,
        centerSpaceRadius: 40,
      )
    );
  }
}
