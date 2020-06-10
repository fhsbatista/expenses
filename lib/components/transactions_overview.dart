import 'dart:math';

import 'package:expenses/components/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';

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
        TransactionForm(
            onSubmit: (title, value) => _addTransaction(title, value)),
        TransactionsList(transactions),
      ],
    );
  }
}
