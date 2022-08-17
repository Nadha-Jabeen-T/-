import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime? _selectedDate;

  /*the submitting data function and validation*/
  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    /*to convert text to double */
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    /*When changed from stateless to stateful, there comes a separation b/w widget class and state class, so to connect the widgets we use "widget." */
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  /*Date picker function */
  void _presentDatePicker() {
    showDatePicker(
      context: context /*global context of this class */,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    }); /*then - gets the value once the future function gets a value in the future */
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen!'
                          : 'Date of Transaction: ${DateFormat.yMd().format(_selectedDate!)}',
                      style:
                          TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: submitData,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button!.color,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  //color: Colors.white,
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
