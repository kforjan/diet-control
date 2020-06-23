import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/meal_card.dart';
import '../widgets/appearing_submit_button.dart';
import '../screens/new_meal_screen.dart';
import '../providers/meals_provider.dart';
import '../providers/meal_selection_provider.dart';
import '../providers/current_intake_provider.dart';

class MealSelection extends StatelessWidget {
  final _scrollController = ScrollController();

  void addSelectedMealToIntakes(BuildContext context) {
    String _selectedId = Provider.of<MealSelectionProvider>(context, listen: false).selectedId;
    Meal _meal = Provider.of<MealsProvider>(context, listen: false).meals.firstWhere((element) => element.id == _selectedId);
    Provider.of<CurrentIntakeProvider>(context, listen: false)
        .addIntakeMeal(_meal);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ChangeNotifierProvider(
      create: (context) => MealSelectionProvider(),
      builder: (context, child) => Container(
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
                        : Scrollbar(
                            controller: _scrollController,
                            isAlwaysShown: true,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              controller: _scrollController,
                              itemCount: Provider.of<MealsProvider>(context,
                                      listen: false)
                                  .meals
                                  .length,
                              itemBuilder: (context, index) => Container(
                                child: (MealCard(
                                  Provider.of<MealsProvider>(context,
                                          listen: false)
                                      .meals[index],
                                )),
                              ),
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
                AppearingSubmitButton(this.addSelectedMealToIntakes),
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
      ),
    );
  }
}
