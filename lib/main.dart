import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

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
  final List<Transaction> transctions = [
    Transaction(
        id: 't1', title: 'New Shows', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment
              .start, //com o widgt Column, Main eh top->down / com Row(), Main eh left->right
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //com o widgt Column, Cross eh left->right / com Row(), Cross eh top->down
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5, //seems that is flying
                child: Text('data'),
              ),
            ),
            Card(
              elevation: 5,
              child:Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: 'Title'),),
                    TextField(decoration: InputDecoration(labelText: 'Amount')),
                    FlatButton(
                      child: Text('Add transaction'),
                      onPressed: () {},
                      textColor: Colors.purple,
                    )
                  ],
                ),
              )),
            Column(
              children: transctions.map((trans) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text('R\$ ${trans.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          trans.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(trans.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
          ],
        ));
  }
}
