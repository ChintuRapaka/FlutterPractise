import "package:flutter/material.dart";
import "package:intl/intl.dart";

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import "./widgets/chart.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: "Expenses App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        splashColor: Colors.grey,
        fontFamily: 'Quicksand',
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 16),
            bodySmall: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 10,
            )),
        appBarTheme: AppBarTheme(
          // textTheme: ThemeData.light().textTheme.copyWith(
          //       title: TextStyle(
          //         fontFamily: 'OpenSans',
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: "t1",
    //   title: "Adidas Shoes",
    //   amount: 99.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "Puma Tracks",
    //   amount: 49.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t3",
    //   title: "iPhone",
    //   amount: 99.90,
    //   date: DateTime.now(),
    // ),
  ];

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: txDate);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _startTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startTransaction(ctx),
            color: Theme.of(ctx).primaryColorLight,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Chart(_recentTransactions),
            ),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startTransaction(ctx),
        child: Icon(Icons.add),
      ),
    );
  }
}
