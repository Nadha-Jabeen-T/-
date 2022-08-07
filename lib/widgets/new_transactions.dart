import 'package:flutter/material.dart';

/*To hold the input transactions */

/*THE WIDGET CLASS */
class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

/*THE STATE CLASS */
class _NewTransactionState extends State<NewTransaction> {
  /*Taking and manipulating user input -- ALL the INPUTS are BY DEFAULT STRING*/
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  /*the submitting data function and validation*/
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    /*to convert text to double */
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    /*When changed from stateless to stateful, there comes a separation b/w widget class and state class, so to connect the widgets we use "widget." */
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onSubmitted: (_) =>
                  submitData, /*onSubmitted returns the value entered by the user, which is caught by the anonymous function argument (_) */
              //onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              /*onChanged: (val) {
                        amountInput = val;
                      },*/
            ),
            FlatButton(
              onPressed: submitData,
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
    );
  }
}
