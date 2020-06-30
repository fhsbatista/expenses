import 'package:flutter/material.dart';

import '../extensions.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalValue;
  final double percentage;

  ChartBar(this.label, this.totalValue, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text(
            totalValue.toCurrency(),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 10,
          height: 60,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
