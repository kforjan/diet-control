import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/overview_screen.dart';
import '../helpers/custom_scroll_behavior.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _wehightFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future registerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
    await prefs.setString('height', _heightController.text);
    await prefs.setString('weight', _weightController.text);
  }

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
                  SizedBox(height: mediaQuery.size.height * 0.1),
                  Image.asset(
                    './assets/images/logo.png',
                    height: mediaQuery.size.height * 0.25,
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.1),
                  Container(
                    width: mediaQuery.size.width * 0.8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _heightController,
                            onFieldSubmitted: (_) {
                              _wehightFocusNode.requestFocus();
                            },
                            validator: (value) {
                              if (double.tryParse(value) == null ||
                                  double.parse(value) < 100 ||
                                  double.parse(value) > 260) {
                                return 'Please enter a valid height.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Your height',
                              suffixText: 'cm',
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.size.height * 0.03,
                          ),
                          TextFormField(
                            controller: _weightController,
                            focusNode: _wehightFocusNode,
                            validator: (value) {
                              if (double.tryParse(value) == null ||
                                  double.parse(value) < 30 ||
                                  double.parse(value) > 300) {
                                return 'Please enter a valid weight.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Your weight',
                              suffixText: 'kg',
                            ),
                          ),
                          SizedBox(height: mediaQuery.size.height * 0.2),
                          RaisedButton(
                            child: Text(
                              'CONFIRM',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                registerUser();
                                Navigator.of(context).pushReplacementNamed(
                                    OverviewScreen.routeName);
                              }
                            },
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
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
