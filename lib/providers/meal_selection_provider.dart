import 'package:flutter/foundation.dart';

import '../models/meal.dart';

class MealSelectionProvider extends ChangeNotifier {
  String selectedId = '';

  bool checkIfSelected(Meal meal) {
    return selectedId == meal.id;
  }

  void setSelected(String mealId) {
    selectedId = mealId;
    notifyListeners();
  }
}
