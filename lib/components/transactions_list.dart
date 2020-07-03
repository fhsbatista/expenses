import 'package:expenses/extensions.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  return transactions[index].toCard(
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
  Card toCard(BuildContext context, Function(String) onDelete) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: FittedBox(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              this.value.toCurrency(),
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
        title: Text(
          this.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat('EEEE, d MMM y').format(this.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).errorColor,
          ),
          onPressed: () => onDelete(this.id),
        ),
      ),
    );
  }
}
