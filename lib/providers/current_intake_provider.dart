import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

import '../models/meal.dart';

class CurrentIntakeProvider extends ChangeNotifier {
  double _proteinWeight = 0;
  double _carbWeight = 0;
  double _fatWeight = 0;

  double get protienWeight {
    return _proteinWeight;
  }

  double get carbWeight {
    return _carbWeight;
  }

  double get fatWeight {
    return _fatWeight;
  }

  Future addIntakeMeal(Meal meal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _proteinWeight += meal.proteinWeight;
    _carbWeight += meal.carbWeight;
    _fatWeight += meal.carbWeight;

    await prefs.setDouble('protein', _proteinWeight);
    await prefs.setDouble('carb', _carbWeight);
    await prefs.setDouble('fat', _fatWeight);
    notifyListeners();
  }

  Future fetchAndSetData() async {
    _proteinWeight = await getProteinData();
    _carbWeight = await getCarbData();
    _fatWeight = await getFatData();
    notifyListeners();
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
    _proteinWeight = 0;
    _carbWeight = 0;
    _fatWeight = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('protein', 0);
    await prefs.setDouble('carb', 0);
    await prefs.setDouble('fat', 0);
    notifyListeners();
  }
}
