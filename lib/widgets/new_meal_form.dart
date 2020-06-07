import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/meals_provider.dart';
import '../models/meal.dart';

class NewMealForm extends StatefulWidget {
  @override
  _NewMealFormState createState() => _NewMealFormState();
}

class _NewMealFormState extends State<NewMealForm> {
  final _formKey = GlobalKey<FormState>();
  final _proteinInputController = TextEditingController();
  final _carbInputController = TextEditingController();
  final _fatInputController = TextEditingController();

  final _carbFocusnode = FocusNode();
  final _fatFocusnode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.45 + mediaQuery.viewInsets.bottom,
      child: Form(
        key: _formKey,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
            width: mediaQuery.size.width * 0.8,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'Proteins (weight)'),
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
                FloatingActionButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Provider.of<MealsProvider>(context, listen: false)
                          .addMeal(Meal(
                        proteinWeight:
                            double.tryParse(_proteinInputController.text),
                        carbWeight: double.tryParse(_carbInputController.text),
                        fatWeight: double.tryParse(_fatInputController.text),
                      ));
                      Navigator.of(context).pop();
                    }
                  },
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
