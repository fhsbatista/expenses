import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions_overview.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('Despesas Pessoais'),
      theme: ThemeData(
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'OpenSans'),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
      id: '32',
      title: 'Tênis de corrida',
      value: 3200,
      date: DateTime.now().subtract(Duration(days: 5)),
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

  _openTransactionForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  void _addTransaction(String title, double value) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(transaction);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionForm(context),
          )
        ],
      ),
      body: TransactionsOverView(_transactions),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionForm(context),
      ),
    );
  }
}
