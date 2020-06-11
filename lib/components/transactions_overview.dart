import 'package:expenses/components/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionsOverView extends StatefulWidget {
  final List<Transaction> _transactions;

  TransactionsOverView(this._transactions);

  @override
  _TransactionsOverViewState createState() => _TransactionsOverViewState();
}

class _TransactionsOverViewState extends State<TransactionsOverView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsList(widget._transactions),
      ],
    );
  }
}
