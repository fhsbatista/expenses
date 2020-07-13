import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onDeleteItem;

  TransactionsList(this.transactions, this.onDeleteItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return transactions[index].toTransactionItem(
                    context,
                    (id) => onDeleteItem(id),
                  );
                },
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Text('Nenhuma transação foi encontrada'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Center(
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

extension on Transaction {
  TransactionItem toTransactionItem(
      BuildContext context, Function(String) onDelete) {
    return TransactionItem(
      id: this.id,
      title: this.title,
      value: this.value,
      date: this.date,
      onDelete: onDelete,
    );
  }
}
