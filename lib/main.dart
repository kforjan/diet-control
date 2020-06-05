import 'package:flutter/material.dart';

import './theme/style.dart';
import './screens/overview_screen.dart';
import './screens/new_meal_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodDiet',
      theme: buildDefaultTheme(),
      routes: {
        '/' : (context) => OverviewScreen(),
        NewMealScreen.routeName : (context) => NewMealScreen(),
      },
    );
  }
}