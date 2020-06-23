import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/current_intake_provider.dart';
import '../widgets/appbar_main.dart';
import '../widgets/progress_bars.dart';
import '../widgets/piechart.dart';
import '../widgets/meal_selection.dart';

class OverviewScreen extends StatelessWidget {
  static const routeName = '/overview-screen';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppbarMain(),
      body: Consumer<CurrentIntakeProvider>(
        builder: (context, intake, child) => Container(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: Provider.of<CurrentIntakeProvider>(context, listen: false)
                  .fetchAndSetIntakes(),
              builder: (context, snapshot) => snapshot.connectionState !=
                      ConnectionState.done
                  ? Padding(
                      padding:
                          EdgeInsets.only(top: mediaQuery.size.height * 0.45),
                      child: Center(child: CircularProgressIndicator()))
                  : Column(
                      children: <Widget>[
                        ProgressBars(),
                        PieChart(
                          protein: intake.protein,
                          carb: intake.carb,
                          fat: intake.fat,
                        ),
                        SizedBox(height: mediaQuery.size.height * 0.08),
                        RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => MealSelection(),
                              isScrollControlled: true,
                              enableDrag: false,
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
          ),
        ),
      ),
    );
  }
}
