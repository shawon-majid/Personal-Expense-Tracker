import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _pickedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredText = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _pickedDate;

    if (enteredText.isEmpty || enteredAmount <= 0 || enteredDate == null) {
      return;
    }

    widget.addTx(
      enteredText,
      enteredAmount,
      enteredDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((userDate) {
      if (userDate == null) {
        return;
      } else
        setState(() {
          _pickedDate = userDate;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),

              // onChanged: (str) {
              //   // titleController.

              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),

              // onChanged: (str) => amountInput = str,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((_pickedDate == null)
                    ? 'No Date Chosen!'
                    : 'Picked Date: ${DateFormat.yMd().format(_pickedDate)}'),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              ),
              style: Theme.of(context).elevatedButtonTheme.style,
            ),
          ],
        ),
      ),
    );
  }
}
