import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './colored_bar.dart';
import '../providers/current_intake_provider.dart';
import '../providers/user_data_provider.dart';

class ProgressBars extends StatefulWidget {
  @override
  _ProgressBarsState createState() => _ProgressBarsState();
}

class _ProgressBarsState extends State<ProgressBars> {
  double _proteinGoal = 0;
  double _carbGoal = 0;
  double _fatGoal = 0;

  @override
  void initState() {
    super.initState();
    UserDataProvider.getProteinGoal().then((value) => _proteinGoal = value);
    UserDataProvider.getCarbGoal().then((value) => _carbGoal = value);
    UserDataProvider.getFatGoal().then((value) {
      _fatGoal = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _proteinWeight = Provider.of<CurrentIntakeProvider>(context).protein;
    final _carbWeight = Provider.of<CurrentIntakeProvider>(context).carb;
    final _fatWeight = Provider.of<CurrentIntakeProvider>(context).fat;

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
