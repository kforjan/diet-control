import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../widgets/appbar_main.dart';
import '../widgets/progress_bars.dart';
import '../widgets/piechart.dart';
import '../widgets/new_meal_form.dart';

class OverviewScreen extends StatelessWidget {
  static const routeName = '/overview-screen';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppbarMain(),
      body: Consumer<MealsProvider>(
        builder: (context, meals, child) => Container(
          child: Column(
            children: <Widget>[
              ProgressBars(),
              PieChart(
                protein: meals.getNutrientWeight(Nutrient.protein),
                carb: meals.getNutrientWeight(Nutrient.carb),
                fat: meals.getNutrientWeight(Nutrient.fat),
              ),
              SizedBox(height: mediaQuery.size.height * 0.08),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => NewMealForm(),
                    isScrollControlled: true,
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
    );
  }
}
