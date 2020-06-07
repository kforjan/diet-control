import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './colored_bar.dart';
import '../providers/meals_provider.dart';

class ProgressBars extends StatefulWidget {
  @override
  _ProgressBarsState createState() => _ProgressBarsState();
}

class _ProgressBarsState extends State<ProgressBars> {
  double _userWeight = 0;
  Future getUserWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userWeight = double.parse(prefs.getString('weight'));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserWeight();
  }

  @override
  Widget build(BuildContext context) {
    final _proteinWeight =
        Provider.of<MealsProvider>(context).getNutrientWeight(Nutrient.protein);
    final _carbWeight =
        Provider.of<MealsProvider>(context).getNutrientWeight(Nutrient.carb);
    final _fatWeight =
        Provider.of<MealsProvider>(context).getNutrientWeight(Nutrient.fat);
    final _proteinGoal = (_userWeight * (35) * 0.25) / 4;
    final _carbGoal = (_userWeight * (35) * 0.5) / 4;
    final _fatGoal = (_userWeight * (35) * 0.25) / 8;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: mediaQuery.size.height * 0.025),
            Text('Daily goal:'),
            ListTile(
              leading: Container(
                width: 20,
                height: 20,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Proteins'),
            ),
            ColoredBar(
              _proteinWeight,
              _proteinGoal,
              Theme.of(context).primaryColor,
            ),
            ListTile(
              leading: Container(
                width: 20,
                height: 20,
                color: Color.fromRGBO(232, 191, 70, 1),
              ),
              title: Text('Carbohydrates'),
            ),
            ColoredBar(_carbWeight, _carbGoal, Color.fromRGBO(232, 191, 70, 1)),
            ListTile(
              leading: Container(
                width: 20,
                height: 20,
                color: Color.fromRGBO(232, 230, 161, 1),
              ),
              title: Text('Fats'),
            ),
            ColoredBar(_fatWeight, _fatGoal, Color.fromRGBO(232, 230, 161, 1)),
          ],
        ),
      ),
    );
  }
}
