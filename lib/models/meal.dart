import 'package:flutter/foundation.dart';

class Meal {
  final double _proteinWeight;
  final double _fatWeight;
  final double _carbWeight;

  Meal({
    @required proteinWeight,
    @required carbWeight,
    @required fatWeight,
  })  : _proteinWeight = proteinWeight,
        _carbWeight = carbWeight,
        _fatWeight = fatWeight;

  double get calories {
    return _proteinWeight * 4 + _fatWeight * 9 + _carbWeight * 4;
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
}
