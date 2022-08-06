import 'package:expense_planner/widgets/user_transactions.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        /*SingleChildScrollView - Only works at the Whole body level */
        child: Center(
          //THE STATISTICS CHART
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: Colors.amber,
                child: Container(
                  width: double.infinity,
                  child: Text('CHART!'),
                ),
                elevation: 5,
              ), //
              //THE INPUT 'ADD-TRANSACTION' AREA
              //THE TRANSACTIONS
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
