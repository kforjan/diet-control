import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider {
  static Future<double> _getCalorieGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final _userWeight = double.parse(prefs.getString('weight'));
    final _userHeight = double.parse(prefs.getString('height'));
    final _userAge = int.parse(prefs.getString('age'));
    final _userGenderConstant = double.parse(prefs.getString('gender'));
    final _userActivityConstant = double.parse(prefs.getString('activity'));
    final _userGoalConstant = double.parse(prefs.getString('goal'));
    return ((10 * _userWeight +
                6.25 * _userHeight -
                5 * _userAge +
                _userGenderConstant) *
            _userActivityConstant) *
        _userGoalConstant;
  }

  static Future<double> getProteinGoal() async {
    return await _getCalorieGoal() * 0.25 / 4;
  }

  static Future<double> getCarbGoal() async {
    return await _getCalorieGoal() * 0.5 / 4;
  }

  static Future<double> getFatGoal() async {
    return await _getCalorieGoal() * 0.25 / 8;
  }
}
