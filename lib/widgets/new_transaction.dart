

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);



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
              // onChanged: (str) {
              //   // titleController.

              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (str) => amountInput = str,
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                addTx(titleController.text, double.parse(amountController.text));
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

