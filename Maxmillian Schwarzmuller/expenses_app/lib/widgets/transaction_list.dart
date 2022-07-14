import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;
  TransactionList(this.transactions, this.removeTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("No transactions are added yet!",
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            "\$${transactions[index].amount}",
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => removeTransaction(transactions[index].id)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
