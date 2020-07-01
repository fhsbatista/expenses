import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extensions.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart({this.transactions});

  List<Map<String, Object>> get _groupedtransactions {
    return List.generate(7, (index) {
      final dayOfWeek = DateTime.now().subtract(Duration(days: index));

      double totalDayValue = 0.0;

      transactions.forEach((element) {
        if (element.date.isSameDayThat(dayOfWeek)) {
          totalDayValue += element.value;
        }
      });

      print('${getDayOfWeekDescription(dayOfWeek)}: $totalDayValue');

      return {
        'day': getDayOfWeekDescription(dayOfWeek),
        'value': totalDayValue,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return _groupedtransactions.fold(0.0, (previousValue, element) {
      return previousValue + element['value'];
    });
  }

  String getDayOfWeekDescription(DateTime day) => DateFormat.E().format(day)[0];

  @override
  Widget build(BuildContext context) {
    _groupedtransactions;
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedtransactions
              .map((transaction) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    transaction['day'],
                    transaction['value'],
                    (transaction['value'] as double) / _weekTotalValue,
                  ),
                );
              })
              .toList()
              .reversed
              .toList(),
        ),
      ),
    );
  }
}
