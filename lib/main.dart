import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String Oprand = "";
  buttonPrissed(String ButtonText){
    if(ButtonText=="C"){
      _output='0';
      num1=0.0;
      num2=0.0;
      Oprand ="";
    } else if (ButtonText == "+" || ButtonText == "-" || ButtonText == "/" || ButtonText == "X"){
      num1= double.parse(output);
      Oprand=ButtonText;
      _output="";

    }else if (ButtonText=='.'){
      if (_output.contains('.')){
        print("Already Contains");
        return;
      }else{
        _output=_output + ButtonText;
      }
    }else if(ButtonText=='='){
      num2=double.parse(output);
      if(Oprand=="+"){
        _output = (num1 + num2).toString();
      }
      if(Oprand=="-"){
        _output = (num1 - num2).toString();
      }
      if(Oprand=="X"){
        _output = (num1 * num2).toString();
      }
      if(Oprand=="/"){
        _output = (num1 / num2).toString();
      }
      num1=0.0;
      num2=0.0;
      Oprand="";
    }else{
      _output=_output+ButtonText;
    }
    print(_output);
    setState(() {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }

  // ignore: non_constant_identifier_names
  Widget Thenumbers({String ButtonText, Color color}) {
    return Expanded(
      child: OutlineButton(
        color: color,
        padding: EdgeInsets.all(24),
        child: Text(
          ButtonText,
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPrissed(ButtonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator '),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(28),
            alignment:Alignment.topRight,
            child: Text(
              output,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: new Divider(),
          ),
          Row(
            children: <Widget>[
              Thenumbers(ButtonText: "C", color: Colors.amber),
//              Thenumbers(ButtonText: "()", color: Colors.amber),
//              Thenumbers(ButtonText: "%", color: Colors.amber),
              Thenumbers(ButtonText: "/", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              Thenumbers(ButtonText: "7", color: Colors.white),
              Thenumbers(ButtonText: "8", color: Colors.white),
              Thenumbers(ButtonText: "9", color: Colors.white),
              Thenumbers(ButtonText: "X", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              Thenumbers(ButtonText: "4", color: Colors.white),
              Thenumbers(ButtonText: "5", color: Colors.white),
              Thenumbers(ButtonText: "6", color: Colors.white),
              Thenumbers(ButtonText: "-", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              Thenumbers(ButtonText: "1", color: Colors.white),
              Thenumbers(ButtonText: "2", color: Colors.white),
              Thenumbers(ButtonText: "3", color: Colors.white),
              Thenumbers(ButtonText: "+", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              Thenumbers(ButtonText: '0', color: Colors.white),
//              Thenumbers(ButtonText: '.', color: Colors.white),
              Thenumbers(ButtonText: "=", color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}
