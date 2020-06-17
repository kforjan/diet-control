import 'package:flutter/material.dart';

import '../screens/new_meal_screen.dart';

class MealSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * 0.53,
      child: Column(
        children: <Widget>[
          Container(
            height: mediaQuery.size.height * 0.43,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, meal) => Container(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                elevation: 0,
                onPressed: null,
              ),
              FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(NewMealScreen.routeName);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
