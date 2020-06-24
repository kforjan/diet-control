import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/overview_screen.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  int _genderRadioValue = 0;
  int _activityRadioValue = 1;
  int _goalRadioValue = 1;
  int _genderConstant = 5;
  double _activityConstant = 1.5;
  double _goalConstant = 1;

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();

  final _wehightFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  Future _registerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen', true);
    await prefs.setString('height', _heightController.text);
    await prefs.setString('weight', _weightController.text);
    await prefs.setString('age', _ageController.text);
    await prefs.setString('gender', _genderConstant.toString());
    await prefs.setString('activity', _activityConstant.toString());
    await prefs.setString('goal', _goalConstant.toString());
  }

  void _handleGenderRadioValueChange(int value) {
    setState(() {
      _genderRadioValue = value;
    });
    if (value == 0) {
      _genderConstant = 5;
    }
    if (value == 1) {
      _genderConstant = -161;
    }
  }

  void _handleActivityRadioValueChange(int value) {
    setState(() {
      _activityRadioValue = value;
    });
    if (value == 0) {
      _activityConstant = 1.2;
    }
    if (value == 1) {
      _activityConstant = 1.5;
    }
    if (value == 2) {
      _activityConstant = 1.75;
    }
  }

  void _handleGoalRadioValueChange(int value) {
    setState(() {
      _goalRadioValue = value;
    });
    if (value == 0) {
      _goalConstant = 0.9;
    }
    if (value == 1) {
      _goalConstant = 1;
    }
    if (value == 2) {
      _goalConstant = 1.1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
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
                helperText: '',
              ),
            ),
            TextFormField(
              controller: _weightController,
              focusNode: _wehightFocusNode,
              onFieldSubmitted: (_) {
                _ageFocusNode.requestFocus();
              },
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
                helperText: '',
              ),
            ),
            TextFormField(
              controller: _ageController,
              focusNode: _ageFocusNode,
              validator: (value) {
                if (double.tryParse(value) == null ||
                    double.parse(value) < 0 ||
                    double.parse(value) > 110) {
                  return 'Please enter your real age.';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Your age',
                helperText: '',
              ),
            ),
            Row(
              children: <Widget>[
                Radio(
                    value: 0,
                    groupValue: _genderRadioValue,
                    onChanged: _handleGenderRadioValueChange),
                Text('Male'),
                Radio(
                  value: 1,
                  groupValue: _genderRadioValue,
                  onChanged: _handleGenderRadioValueChange,
                ),
                Text('Female'),
              ],
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Activity'),
            ),
            Row(
              children: <Widget>[
                Radio(
                    value: 0,
                    groupValue: _activityRadioValue,
                    onChanged: _handleActivityRadioValueChange),
                Text('Light'),
                Radio(
                  value: 1,
                  groupValue: _activityRadioValue,
                  onChanged: _handleActivityRadioValueChange,
                ),
                Text('Moderate'),
                Radio(
                  value: 2,
                  groupValue: _activityRadioValue,
                  onChanged: _handleActivityRadioValueChange,
                ),
                Text('Heavy'),
              ],
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Lose / gain / maintain your weight?'),
            ),
            Row(
              children: <Widget>[
                Radio(
                    value: 0,
                    groupValue: _goalRadioValue,
                    onChanged: _handleGoalRadioValueChange),
                Text('Lose'),
                Radio(
                  value: 1,
                  groupValue: _goalRadioValue,
                  onChanged: _handleGoalRadioValueChange,
                ),
                Text('Maintain'),
                Radio(
                  value: 2,
                  groupValue: _goalRadioValue,
                  onChanged: _handleGoalRadioValueChange,
                ),
                Text('Gain'),
              ],
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            RaisedButton(
              child: Text(
                'CONFIRM',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _registerUser();
                  Navigator.of(context)
                      .pushReplacementNamed(OverviewScreen.routeName);
                }
              },
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
