import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionsOverView extends StatefulWidget {
  final List<Transaction> _transactions;
  final Function(String) _onDeleteTransactionRequest;

  List<Transaction> get _transactionsOnLast7Days {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  TransactionsOverView(this._transactions, this._onDeleteTransactionRequest);

  @override
  _TransactionsOverViewState createState() => _TransactionsOverViewState();
}

class _TransactionsOverViewState extends State<TransactionsOverView> {
  bool _isChartVisible = false;

  _onChartVisibilitySwithChanged(bool isChecked) {
    setState(() => _isChartVisible = isChecked);
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = Scaffold.of(context).appBarMaxHeight;
    final screenHeight = MediaQuery.of(context).size.height;
    final availableSize = screenHeight - appBarHeight;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Exibir gráfico'),
              Switch(
                value: _isChartVisible,
                onChanged: (value) => _onChartVisibilitySwithChanged(value),
              ),
            ],
          ),
          _isChartVisible
              ? Container(
                  height: availableSize * 0.22,
                  child: Chart(transactions: widget._transactionsOnLast7Days),
                )
              : Container(
                  height: availableSize * 0.78,
                  child: TransactionsList(
                      widget._transactions, widget._onDeleteTransactionRequest),
                ),
        ],
      ),
    );
  }
}
