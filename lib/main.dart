import './transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //creating a listof transactions
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Gold Jimki',
      amount: 125,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Metal bangles',
      amount: 80,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Bait-AL-Mandi Alfaham',
      amount: 369.99,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.amber,
              child: Container(
                width: double.infinity,
                child: Text('CHART!'),
              ),
              elevation: 5,
            ),
            Card(
              child: Text('List of Transactions!'),
            )
          ],
        ),
      ),
    );
  }
}
