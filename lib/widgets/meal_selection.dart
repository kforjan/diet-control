import 'package:diet_app/helpers/db_helper.dart';
import 'package:diet_app/providers/meals_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_card.dart';
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
            child: FutureBuilder(
              future: Provider.of<MealsProvider>(context, listen: false)
                  .fetchAndSetData(),
              builder: (context, snapshot) => snapshot.connectionState !=
                      ConnectionState.done
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : (Provider.of<MealsProvider>(context).meals == null ||
                          Provider.of<MealsProvider>(context, listen: false)
                              .meals
                              .isEmpty
                      ? Center(
                          child: Text('You have not added any meals yet.'),
                        )
                      : ListView.builder(
                          itemCount:
                              Provider.of<MealsProvider>(context, listen: false)
                                  .meals
                                  .length,
                          itemBuilder: (context, index) => Container(
                            child: (MealCard(Provider.of<MealsProvider>(context,
                                    listen: false)
                                .meals[index])),
                          ),
                        )),
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
                  DBHelper.getData(DBHelper.table)
                      .then((value) => print(value));
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
