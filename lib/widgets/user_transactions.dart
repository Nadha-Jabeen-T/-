import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transactions.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
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
  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction), //Input-transaction-widget
        TransactionList(_userTransactions), //Transaction-widget
      ],
    );
  }
}
