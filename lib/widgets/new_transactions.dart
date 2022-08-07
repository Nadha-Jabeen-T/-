import 'package:flutter/material.dart';

/*To hold the input transactions */

class NewTransaction extends StatelessWidget {
  /*Taking and manipulating user input -- ALL the INPUTS are BY DEFAULT STRING*/
  //String? titleInput;
  //String? amountInput;

  /*alternate way of accepting user input with each key stroke*/
  /*These controllers saves the user input to the controller handle */
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  /*Shows a sheet, when the floating action button is pressed */
  void startAddNewTransaction(BuildContext ctx) {
    /*startAddNewTransaction takes the context of the "Transaction sheet" => give it to showModalBottomSheet, which accepts that context -> and give it to builder*/
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(addTx);
        });
  }

  /* Function pointer to get the added new transaction*/
  final Function addTx;
  NewTransaction(this.addTx);

  /*the submitting data function and validation*/
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    /*to convert text to double */
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
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
