import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as chart;

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.3,
      child: chart.PieChart(
        chart.PieChartData(
          borderData: chart.FlBorderData(border: Border.all(width: 0)),
          centerSpaceRadius: mediaQuery.size.height * 0.045,
          startDegreeOffset: 60,
          sections: [
            chart.PieChartSectionData(
              color: Theme.of(context).primaryColor,
              title: 'Protein',
              showTitle: false,
              value: 2,
            ),
            chart.PieChartSectionData(
              color: Color.fromRGBO(232, 191, 70, 1),
              title: 'Carbohydrate',
              showTitle: false,
              value: 1,
            ),
            chart.PieChartSectionData(
              color: Color.fromRGBO(232, 230, 161, 1),
              title: 'Fat',
              showTitle: false,
              value: 1,
            ),
          ],
        ),
      ),
    );
  }
}
