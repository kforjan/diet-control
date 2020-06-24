import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/meal.dart';

class CurrentIntakeProvider extends ChangeNotifier {
  double _protein = 0;
  double _carb = 0;
  double _fat = 0;

  double get protein {
    return _protein;
  }

  double get carb {
    return _carb;
  }

  double get fat {
    return _fat;
  }

  Future addIntakeMeal(Meal meal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _protein += meal.proteinWeight;
    _carb += meal.carbWeight;
    _fat += meal.fatWeight;

    await prefs.setDouble('protein', _protein);
    await prefs.setDouble('carb', _carb);
    await prefs.setDouble('fat', _fat);
    await prefs.setString('date', DateTime.now().toIso8601String());
    notifyListeners();
  }

  Future fetchAndSetIntakes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime lastDate =
        DateTime.parse(prefs.getString('date')) ?? DateTime.now();
    if (lastDate.isSameDate(DateTime.now())) {
      if (_fat == null || _protein == null || _carb == null) {
        _protein = prefs.getDouble('protein') ?? 0;
        _carb = prefs.getDouble('carb') ?? 0;
        _fat = prefs.getDouble('fat') ?? 0;
        notifyListeners();
      }
    } else {
      await prefs.setString('date', DateTime.now().toIso8601String());
      deleteIntakes();
    }
  }

  Future deleteIntakes() async {
    _protein = 0;
    _carb = 0;
    _fat = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('protein');
    await prefs.remove('carb');
    await prefs.remove('fat');
    await prefs.remove('date');
    notifyListeners();
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
