import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme/style.dart';
import './providers/meals_provider.dart';
import './screens/overview_screen.dart';
import './screens/edit_inputs_screen.dart';
import './screens/registration_screen.dart';
import './screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MealsProvider(),
      child: MaterialApp(
        title: 'GoodDiet',
        theme: buildDefaultTheme(),
        routes: {
          '/': (context) => SplashScreen(),
          OverviewScreen.routeName: (context) => OverviewScreen(),
          EditInputsScreen.routeName: (context) => EditInputsScreen(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}
