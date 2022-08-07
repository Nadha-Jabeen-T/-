import 'package:expense_planner/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Almanac',
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
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
