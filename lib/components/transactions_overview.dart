import 'dart:math';

import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transactions_list.dart';

class TransactionsOverView extends StatefulWidget {
  @override
  _TransactionsOverViewState createState() => _TransactionsOverViewState();
}

class _TransactionsOverViewState extends State<TransactionsOverView> {
  final transactions = [
    Transaction(
      id: '32',
      title: 'Tênis de corrida',
      value: 320,
      date: DateTime.now(),
    ),
    Transaction(
      id: '33',
      title: 'Celular',
      value: 980,
      date: DateTime.now(),
    ),
    Transaction(
      id: '34',
      title: 'Monitor',
      value: 3220,
      date: DateTime.now(),
    )
  ];

  void _addTransaction(String title, double value) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsList(transactions),
        TransactionForm(
            onSubmit: (title, value) => _addTransaction(title, value)),
      ],
    );
  }
}
