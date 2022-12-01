

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  
  
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);


  void submitData(){

    final enteredText = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredText.isEmpty || enteredAmount <= 0){
      return;
    }


    addTx(
      enteredText,
      enteredAmount,
      );
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
              controller: titleController,
              onSubmitted: (_) => submitData(),
              
              
              // onChanged: (str) {
              //   // titleController.

              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),

              // onChanged: (str) => amountInput = str,
            ),
            TextButton(
              onPressed: submitData,
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

