import 'package:diet_app/helpers/slide_right_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'providers/current_intake_provider.dart';
import 'providers/meals_provider.dart';
import 'screens/new_meal_screen.dart';
import 'screens/overview_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/style.dart';

void main() => runApp(GoodDietApp());

class GoodDietApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentIntakeProvider>(
          create: (context) => CurrentIntakeProvider(),
        ),
        ChangeNotifierProvider<MealsProvider>(
          create: (context) => MealsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'GoodDiet',
        theme: buildDefaultTheme(),
        routes: {
          '/': (context) => SplashScreen(),
          OverviewScreen.routeName: (context) => OverviewScreen(),
          NewMealScreen.routeName: (context) => NewMealScreen(),
          RegistrationScreen.routeName: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}
