import 'package:flutter/foundation.dart';

class Meal {
  final String _id;
  final String _name;
  final double _proteinWeight;
  final double _fatWeight;
  final double _carbWeight;

  String get id {
    return _id;
  }

  double get calories {
    return _proteinWeight * 4 + _fatWeight * 9 + _carbWeight * 4;
  }

  String get name {
    return this._name;
  }

  double get proteinWeight {
    return this._proteinWeight;
  }

  double get fatWeight {
    return this._fatWeight;
  }

  double get carbWeight {
    return this._carbWeight;
  }

  Meal({
    @required id,
    name,
    @required proteinWeight,
    @required carbWeight,
    @required fatWeight,
  })  : _id = id,
        _name = name,
        _proteinWeight = proteinWeight,
        _carbWeight = carbWeight,
        _fatWeight = fatWeight;
}
