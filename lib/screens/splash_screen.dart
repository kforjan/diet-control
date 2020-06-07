import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

import './registration_screen.dart';
import './overview_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacementNamed(OverviewScreen.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(RegistrationScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          './assets/images/logo.png',
          height: mediaQuery.size.height * 0.5,
        ),
      ),
    );
  }
}
