import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './transaction.dart';

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
    Transaction(id: 't1', title: 'New Shows',amount: 69.99,date: DateTime.now()),
    Transaction(id: 't2', title: 'Weekly Groceries',amount: 16.53,date: DateTime.now())
  ];



   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,//com o widgt Column, Main eh top->down / com Row(), Main eh left->right
        crossAxisAlignment: CrossAxisAlignment.stretch,//com o widgt Column, Cross eh left->right / com Row(), Cross eh top->down
        children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blue,
            elevation: 5,//seems that is flying
            child: Text('data'),
          ),
        ),
        Column(
          children: transctions.map((trans) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15
                    ),
                    decoration: BoxDecoration(border:Border.all(
                      color: Colors.black, 
                      width: 2)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(trans.amount.toString()),
                  ),
                  Column(children: <Widget>[
                    Text(trans.title),
                    Text(trans.date.toString())
                  ],)

                ],)
            );
       }).toList(),),
      ],)
      );
  }
}