import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";
import "./chart_bar.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySum = 0;
      // for (int i = 0; i < recentTransactions.length; i++) {
      // if (recentTransactions[i].date.day == weekDay.day &&
      //     recentTransactions[i].date.month == weekDay.month &&
      //     recentTransactions[i].date.year == weekDay.year) {
      //       daySum += recentTransactions[i].amount;
      //     }
      // }
      for (Transaction tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          daySum += tx.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': daySum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + double.parse(item['amount'].toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            // return Text("hi");
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'].toString(),
                double.parse(data['amount'].toString()),
                totalSpending == 0.0
                    ? 0.0
                    : double.parse(data['amount'].toString()) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
