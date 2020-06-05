import 'package:flutter/material.dart';

import './colored_bar.dart';

class ProgressBars extends StatefulWidget {
  @override
  _ProgressBarsState createState() => _ProgressBarsState();
}

class _ProgressBarsState extends State<ProgressBars> {
  @override
  Widget build(BuildContext context) {
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
            ColoredBar(1, Theme.of(context).primaryColor),
            ListTile(
              leading: Container(
                width: 20,
                height: 20,
                color: Color.fromRGBO(232, 191, 70, 1),
              ),
              title: Text('Carbohydrates'),
            ),
            ColoredBar(1, Color.fromRGBO(232, 191, 70, 1)),
            ListTile(
              leading: Container(
                width: 20,
                height: 20,
                color: Color.fromRGBO(232, 230, 161, 1),
              ),
              title: Text('Fats'),
            ),
            ColoredBar(1, Color.fromRGBO(232, 230, 161, 1)),
          ],
        ),
      ),
    );
  }
}
