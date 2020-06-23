import 'package:flutter/foundation.dart';

import '../models/meal.dart';
import '../helpers/db_helper.dart';

class MealsProvider extends ChangeNotifier {
  List<Meal> _meals;

  List<Meal> get meals{
    if(_meals == null){
      return null;
    }
    return [..._meals];
  }

  Future addMeal(Meal meal) async {
    _meals.add(meal);
    await DBHelper.insert(DBHelper.table, meal);
    notifyListeners();
  }

  Future fetchAndSetData() async {
    if (_meals == null) {
      _meals = [];
      final data = await DBHelper.getData(DBHelper.table);
      data.forEach((element) {
        _meals.add(
          Meal(
            id: element[DBHelper.columnId],
            name: element[DBHelper.columnName],
            proteinWeight: element[DBHelper.columnProtein],
            carbWeight: element[DBHelper.columnCarb],
            fatWeight: element[DBHelper.columnFat],
          ),
        );
      });
      notifyListeners();
    }
  }

  void deleteMeal() {}

  Future deleteAllMeals() async{
    await DBHelper.deleteData(DBHelper.table);
    _meals = null;
    notifyListeners();
  }
}
