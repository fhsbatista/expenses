import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionsOverView extends StatefulWidget {
  final List<Transaction> _transactions;

  List<Transaction> get _transactionsOnLast7Days {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  TransactionsOverView(this._transactions);

  @override
  _TransactionsOverViewState createState() => _TransactionsOverViewState();
}

class _TransactionsOverViewState extends State<TransactionsOverView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Chart(transactions: widget._transactionsOnLast7Days),
        TransactionsList(widget._transactions),
      ],
    );
  }
}
