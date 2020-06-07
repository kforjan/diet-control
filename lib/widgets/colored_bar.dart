import 'package:flutter/material.dart';

class ColoredBar extends StatelessWidget {
  final double currentWeight;
  final double goal;
  final Color color;

  ColoredBar(this.currentWeight, this.goal, this.color);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final goalPercentage = currentWeight / goal;
    return Container(
      width: mediaQuery.size.width * 0.8,
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            width: (currentWeight != null && goal != null)
                ? (goalPercentage > 1
                    ? mediaQuery.size.width * 0.4
                    : mediaQuery.size.width * 0.4 * (goalPercentage))
                : 5,
            height: 5,
            color: color,
            duration: Duration(milliseconds: 1000),
          ),
          SizedBox(
            width: 25,
          ),
          Text((currentWeight < 10000000 ? currentWeight : 9999999)
                  .toStringAsFixed(0) +
              'g/' +
              (goal).toStringAsFixed(0) +
              'g'),
        ],
      ),
    );
  }
}
