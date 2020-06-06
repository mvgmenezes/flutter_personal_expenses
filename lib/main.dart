import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_expenses/widgets/user_transactions.dart';



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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter app'),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                UserTransactions()
              ],
            ),
        ));
  }
}
