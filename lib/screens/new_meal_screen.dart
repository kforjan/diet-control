import 'package:diet_app/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/custom_scroll_behavior.dart';
import '../providers/current_intake_provider.dart';
import '../models/meal.dart';

class NewMealScreen extends StatefulWidget {
  static const routeName = '/new-meal';

  @override
  _NewMealScreenState createState() => _NewMealScreenState();
}

class _NewMealScreenState extends State<NewMealScreen> {
  final _formKey = GlobalKey<FormState>();
  var _nameInputController = TextEditingController();
  var _proteinInputController = TextEditingController();
  var _carbInputController = TextEditingController();
  var _fatInputController = TextEditingController();

  var _proteinFocusnode = FocusNode();
  var _carbFocusnode = FocusNode();
  var _fatFocusnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Widget spacing = SizedBox(height: mediaQuery.size.height * 0.03);
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a new meal'),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: mediaQuery.size.height * 0.05),
                width: mediaQuery.size.width * 0.8,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Name'),
                      maxLength: 25,
                      controller: _nameInputController,
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _proteinFocusnode.requestFocus(),
                    ),
                    spacing,
                    TextFormField(
                      focusNode: _proteinFocusnode,
                      decoration:
                          InputDecoration(hintText: 'Proteins (weight)'),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      controller: _proteinInputController,
                      validator: (value) {
                        if (double.tryParse(value) == null ||
                            value == null ||
                            double.tryParse(value) < 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _carbFocusnode.requestFocus(),
                    ),
                    spacing,
                    TextFormField(
                      focusNode: _carbFocusnode,
                      decoration:
                          InputDecoration(hintText: 'Carbohydrates (weight)'),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      controller: _carbInputController,
                      validator: (value) {
                        if (double.tryParse(value) == null ||
                            value == null ||
                            double.tryParse(value) < 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _fatFocusnode.requestFocus(),
                    ),
                    spacing,
                    TextFormField(
                      focusNode: _fatFocusnode,
                      decoration: InputDecoration(hintText: 'Fats (weight)'),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      controller: _fatInputController,
                      validator: (value) {
                        if (double.tryParse(value) == null ||
                            value == null ||
                            double.tryParse(value) < 0) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: mediaQuery.size.height * 0.2),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Meal newMeal = Meal(
                            name: _nameInputController.text,
                            proteinWeight:
                                double.tryParse(_proteinInputController.text),
                            carbWeight:
                                double.tryParse(_carbInputController.text),
                            fatWeight:
                                double.tryParse(_fatInputController.text),
                          );
                          Provider.of<CurrentIntakeProvider>(context,
                                  listen: false)
                              .addIntakeMeal(newMeal);
                          Provider.of<MealsProvider>(context, listen: false).addMeal(newMeal);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'CREATE',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
