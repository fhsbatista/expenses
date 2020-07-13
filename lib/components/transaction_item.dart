import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extensions.dart';

class TransactionItem extends StatelessWidget {
  final String id;
  final String title;
  final double value;
  final DateTime date;
  final Function onDelete;

  const TransactionItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.date,
    @required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
