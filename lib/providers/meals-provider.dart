import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import '../models/meal.dart';

enum Nutrient {
  protein,
  carb,
  fat,
}

class MealsProvider extends ChangeNotifier {
  List<Meal> _meals = [];

  void addMeal(Meal meal) {
    _meals.add(meal);
    notifyListeners();
  }

  double getNutrientWeight(Nutrient nutrient) {
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
}
