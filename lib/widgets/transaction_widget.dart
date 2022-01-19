import 'package:expense_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TrasactionList extends StatelessWidget {
  late final List<Transaction> transaction;
  final Function deleteTx;
  TrasactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Transaction Yet",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .1,
                  ),
                  Container(
                    height: constraints.maxHeight * .8,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return TransactionItem(
                    transaction: transaction[i], deleteTx: deleteTx);
              },
              itemCount: transaction.length,
            ),
    );
  }
}
