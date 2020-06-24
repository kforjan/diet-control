import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/meal.dart';

class CurrentIntakeProvider extends ChangeNotifier {
  double _protein;
  double _carb;
  double _fat;

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
        _protein = await getProteinIntake();
        _carb = await getCarbIntake();
        _fat = await getFatIntake();
        notifyListeners();
      }
    } else {
      deleteIntakes();
    }
  }

  Future<double> getProteinIntake() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _protein = (prefs.getDouble('protein') ?? 0);
    return _protein;
  }

  Future<double> getCarbIntake() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _carb = (prefs.getDouble('carb') ?? 0);
    return _carb;
  }

  Future<double> getFatIntake() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double _fat = (prefs.getDouble('fat') ?? 0);
    return _fat;
  }

  Future deleteIntakes() async {
    _protein = 0;
    _carb = 0;
    _fat = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('protein', 0);
    await prefs.setDouble('carb', 0);
    await prefs.setDouble('fat', 0);
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
