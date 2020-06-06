import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0 ){
      return;
    }
    widget.addTx(
        titleController.text,
        double.parse(amountController.text)
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child:Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      onSubmitted: (_)=> submitData(),
                      //onChanged: (value) { this.titleInput = value;},
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_)=> submitData(),
                      //onChanged: (value) { this.amountInput = value;},
                    ),
                    FlatButton(
                      child: Text('Add transaction'),
                      onPressed: submitData,
                      textColor: Colors.purple,
                    )
                  ],
                ),
              )
              );
  }
}