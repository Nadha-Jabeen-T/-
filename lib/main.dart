import './widgets/transaction_list.dart';
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
  /*Taking and manipulating user input -- ALL the INPUTS are BY DEFAULT STRING*/
  //String? titleInput;
  //String? amountInput;
  /*alternate way of accepting user input with each key stroke*/
  final titleController = TextEditingController();
  /*These controllers saves the user input to the controller handle */
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
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
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 0,
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      //onChanged: (val) => titleInput = val,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      /*onChanged: (val) {
                        amountInput = val;
                      },*/
                    ),
                    FlatButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              elevation: 5,
            ),
            //THE TRANSACTIONS
            TransactionList()
          ],
        ),
      ),
    );
  }
}
