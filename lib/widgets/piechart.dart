import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as chart;

class PieChart extends StatelessWidget {
  final _protein;
  final _carb;
  final _fat;

  PieChart({
    @required protein,
    @required carb,
    @required fat,
  })  : _protein = protein,
        _carb = carb,
        _fat = fat;

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
              value: _protein,
            ),
            chart.PieChartSectionData(
              color: Color.fromRGBO(232, 191, 70, 1),
              title: 'Carbohydrate',
              showTitle: false,
              value: _carb,
            ),
            chart.PieChartSectionData(
              color: Color.fromRGBO(232, 230, 161, 1),
              title: 'Fat',
              showTitle: false,
              value: _fat,
            ),
          ],
        ),
      ),
    );
  }
}
