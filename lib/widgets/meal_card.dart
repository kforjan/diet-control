import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../providers/meal_selection_provider.dart';
import '../providers/meals_provider.dart';

class MealCard extends StatefulWidget {
  final Meal meal;

  MealCard(
    this.meal,
  );

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Center(
      child: Dismissible(
        key: Key(widget.meal.id),
        onDismissed: (_) {
          Provider.of<MealsProvider>(context).deleteMeal(widget.meal);
        },
        direction: DismissDirection.endToStart,
        background: Container(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          color: Colors.red,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: ChoiceChip(
            backgroundColor: Colors.transparent,
            selected: Provider.of<MealSelectionProvider>(context)
                .checkIfSelected(widget.meal),
            onSelected: (selected) {
              Provider.of<MealSelectionProvider>(context, listen: false)
                  .setSelected(widget.meal.id);
            },
            label: Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height * 0.1,
              child: Center(
                child: Text(
                  widget.meal.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(),
            disabledColor: Color.fromRGBO(0, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
