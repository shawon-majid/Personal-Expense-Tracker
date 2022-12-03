import 'package:flutter/material.dart';
import '../widgets/chart_bar.dart';

import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  double get getTotalSpending {
    var ret = 0.0;
    for (int i = 0; i < recentTransactions.length; i++) {
      ret += recentTransactions[i].amount;
    }
    return ret;
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      // print(DateFormat.E().format(weekDay));
      // print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: groupedTransactionValues.map((e) {
          return ChartBar(
            e['day'],
            (e['amount'] as double),
            (getTotalSpending == 0.0)
                ? 0
                : (e['amount'] as double) / getTotalSpending,
          );
        }).toList(),
      ),
    );
  }
}
