import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/meal.dart';
import '../helpers/db_helper.dart';

enum Nutrient {
  protein,
  carb,
  fat,
}

class MealsProvider extends ChangeNotifier {
  List<Meal> _meals = [];

  Future addMeal(Meal meal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _meals.add(meal);
    await prefs.setDouble(
        'protein', getCurrentNutrientWeight(Nutrient.protein));
    await prefs.setDouble('carb', getCurrentNutrientWeight(Nutrient.carb));
    await prefs.setDouble('fat', getCurrentNutrientWeight(Nutrient.fat));
    notifyListeners();
    DBHelper.insert('user_meals', {
      'id': DateTime.now(), //pseudo id...
      'name': meal.name,
      'protein': meal.proteinWeight,
      'carb': meal.carbWeight,
      'fat': meal.fatWeight,
    });
  }

  double getCurrentNutrientWeight(Nutrient nutrient) {
    double weight = 0;
    if (_meals.isEmpty) {
      return 0;
    }
    if (nutrient == Nutrient.protein) {
      _meals.forEach((meal) {
        weight += meal.proteinWeight;
      });
      return weight;
    }
    if (nutrient == Nutrient.carb) {
      _meals.forEach((meal) {
        weight += meal.carbWeight;
      });
      return weight;
    }
    if (nutrient == Nutrient.fat) {
      _meals.forEach((meal) {
        weight += meal.fatWeight;
      });
      return weight;
    }
    return 0;
  }

  Future fetchAndSetData() async {
    if (_meals.isEmpty) {
      _meals.add(Meal(
        proteinWeight: await getProteinData(),
        carbWeight: await getCarbData(),
        fatWeight: await getFatData(),
      ));
      notifyListeners();
    }
  }

  Future<double> getProteinData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _protein = (prefs.getDouble('protein') ?? 0);
    return _protein;
  }

  Future<double> getCarbData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _carb = (prefs.getDouble('carb') ?? 0);
    return _carb;
  }

  Future<double> getFatData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _fat = (prefs.getDouble('fat') ?? 0);
    return _fat;
  }

  Future deleteData() async {
    _meals = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('protein', 0);
    await prefs.setDouble('carb', 0);
    await prefs.setDouble('fat', 0);
    notifyListeners();
  }
}
