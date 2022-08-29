import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return
        /*fixed height dosen't allow to scroll in the landscape mode*/
        transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions added yet :-(',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10, /*Separator */
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit
                          .cover, //But to cover the area , it needed a fixed width container
                    ),
                  )
                ],
              )
            : ListView.builder(
                /*ListView - Column or row with a SingleChildScrollableView - to give scrolling to a specific item */
                /*ListView always needed a fixed height wrapper*/
                itemBuilder: (ctx, index) {
                  /*ListView builder takes the context(position of item in the widget tree) and index of item to be shown on screen */
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '₹ ${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(transactions[index].title,
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteTx(transactions[index].id),
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                  /*return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 125,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          //tx.amount.toString(),
                          '₹ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style: Theme.of(context).textTheme.headline6),
                          Text(
                            //tx.date.toString(),
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );*/
                },
                itemCount: transactions.length,
                //children: transactions.map((tx) {}).toList(),--No need of mapping
              );
  }
}
