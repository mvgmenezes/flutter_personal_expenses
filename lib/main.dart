import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

import 'models/transaction.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand' ,//defined in pubspec.yaml
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          button: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
            )
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _user_transctions = [
   /* Transaction(
        id: 't1', title: 'New Shows', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())*/
  ];

  List<Transaction> get _recentTransactions{
    return _user_transctions.where((tran) {
      return tran.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
  void _addNewTransaction(String title, double amount, DateTime chosenDate){
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate
    );

    setState(() {
      _user_transctions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _user_transctions.retainWhere((element) => element.id ==id);
    });
  }

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (bCtx) {
      return GestureDetector( //using the gersture to avoid the click inside and close the modal
        onTap: () {},
        child: NewTransaction(_addNewTransaction) ,
        behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),)
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment
                .start, //com o widgt Column, Main eh top->down / com Row(), Main eh left->right
            crossAxisAlignment: CrossAxisAlignment
                .stretch, //com o widgt Column, Cross eh left->right / com Row(), Cross eh top->down
            children: <Widget>[
              Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) * 0.4,
                  child: Chart(_recentTransactions)),
              Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) * 0.6,
                  child: TransactionList(_user_transctions, _deleteTransaction)),
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:() => _startAddNewTransaction(context),
      ),
    );
  }
}
