import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String title, double value) onSubmit;

  TransactionForm({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextFormField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: () {
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    if (title.isNotEmpty && value != 0.0) {
                      onSubmit(title, value);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
