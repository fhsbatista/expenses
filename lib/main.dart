import 'package:expenses/components/transactions_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Text('Gráfico'),
              elevation: 5,
            ),
            TransactionsOverView(),
          ],
        ),
      ),
    );
  }
}
