import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value, DateTime date) onSubmit;

  TransactionForm({this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate;

  void _onSubmit() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    final date = _selectedDate;

    if (title.isEmpty || value <= 0.0 || date == null) {
      return;
    }

    widget.onSubmit(title, value, date);
  }

  _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      setState(() {
        if (date != null) _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.0,
            right: 10.0,
            left: 10.0,
            bottom: 10.0 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                onFieldSubmitted: (_) => _onSubmit(),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                onFieldSubmitted: (_) => _onSubmit(),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                onFieldSubmitted: (_) => _onSubmit(),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                onFieldSubmitted: (_) => _onSubmit(),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                onFieldSubmitted: (_) => _onSubmit(),
              ),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                onFieldSubmitted: (_) => _onSubmit(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada'
                          : 'Data Selecionada: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Selecionar Data',
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _openDatePicker,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Nova Transação'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: _onSubmit,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      elevation: 5,
    );
  }
}
