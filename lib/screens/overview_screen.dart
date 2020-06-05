import 'package:flutter/material.dart';

import '../widgets/appbar_main.dart';
import '../widgets/progress_bars.dart';
import '../widgets/piechart.dart';
import '../widgets/meal_selection.dart';

class OverviewScreen extends StatelessWidget {
  static const routeName = '/overview-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMain(),
      body: Container(
        child: Column(
          children: <Widget>[
            ProgressBars(),
            PieChart(),
            SizedBox(height: 30,),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => MealSelection(),
                );
              },
              child: Text(
                'Add a meal',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
