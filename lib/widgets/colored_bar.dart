import 'package:flutter/material.dart';

class ColoredBar extends StatelessWidget {
  final double percentage;
  final Color color;

  ColoredBar(this.percentage, this.color);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.6,
      child: Row(
        children: <Widget>[
          Container(
            width: mediaQuery.size.width * 0.4 * percentage,
            height: 5,
            color: color,
          ),
          SizedBox(
            width: 25,
          ),
          Text((percentage * 100).toStringAsFixed(0) + '%'),
        ],
      ),
    );
  }
}
