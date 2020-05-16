import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

final myController = TextEditingController();
final myController1 = TextEditingController();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Two Numbers',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Test App'),
          leading: Icon(Icons.home),
        ),
        body: Container(
          width: 300,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: myController,
                decoration:
                    new InputDecoration(labelText: 'Enter First Integer'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
              TextField(
                controller: myController1,
                decoration:
                    new InputDecoration(labelText: 'Enter Second Integer'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
              new Container(
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: addNum,
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 15),
                        )),
                        RaisedButton(
                        onPressed: multNum,
                        child: Text(
                          'Multiply',
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
              ),
              new Text("Result: $sum")
            ],
          ),
        ),
      ),
    );
  }
  int sum;
  void addNum(){
    int first = int.parse(myController.text);
    int second = int.parse(myController1.text);
    setState(() {
      sum = first+second;
    });
  }
  void multNum(){
    int first = int.parse(myController.text);
    int second = int.parse(myController1.text);
    setState(() {
      sum = first*second;
    });
  }
}