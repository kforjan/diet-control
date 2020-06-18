import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  MealCard(this.meal);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Center(
      child: Container(
        child: ChoiceChip(
          label: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height * 0.1,
            child: Center(
              child: Text(
                meal.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          selected: true,
          shape: RoundedRectangleBorder(),
          disabledColor: Color.fromRGBO(0, 0, 0, 0),
        ),
      ),
    );
  }
}
