import 'package:flutter/material.dart';

import '../widgets/registration_form.dart';
import '../helpers/custom_scroll_behavior.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  Image.asset(
                    './assets/images/logo.png',
                    height: mediaQuery.size.height * 0.15,
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.02),
                  Container(
                    width: mediaQuery.size.width * 0.8,
                    child: RegistrationForm(),
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
