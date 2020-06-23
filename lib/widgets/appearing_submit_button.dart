import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/meal_selection_provider.dart';

class AppearingSubmitButton extends StatelessWidget {
  final Function submit;

  AppearingSubmitButton(this.submit);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: Provider.of<MealSelectionProvider>(context).selectedId != '',
      child: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          submit(context);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
