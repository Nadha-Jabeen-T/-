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

  /* Function pointer to get the added new transaction*/
  final Function addTx;
  NewTransaction(this.addTx);

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
                //print(titleController.text);
                //print(amountController.text);_
                addTx(
                  titleController.text,
                  double.parse(
                      amountController.text), /*to convert text to double */
                );
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
    );
  }
}
