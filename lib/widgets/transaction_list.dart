import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteItem;

  TransactionList(this.transactions, this.deleteItem);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty? Column(
          children: <Widget>[
            Text('No transaction', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 20,), //adicionando um espaco entre o texto e a imagem
            Container(
                height: 200,
                child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
          ],
      ):ListView.builder(
        itemBuilder: (ctx, index) {
           return Card(
             margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
             elevation: 5,
             child:
             ListTile(
              leading:
                CircleAvatar(
                   radius: 30,
                   child: Padding(
                     padding: EdgeInsets.all(6),
                     child: FittedBox(
                         child: Text('\$${transactions[index].amount}')
                     ),
                   ),
                 ),
              title: Text(transactions[index].title, style: Theme.of(context).textTheme.title,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteItem(transactions[index].id),
              ),
             ),
           );
        },
        itemCount: transactions.length,
      );
  }
}