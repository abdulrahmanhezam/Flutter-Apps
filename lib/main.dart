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
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        print("Already Contains");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "/" || num2 == 0) {
        print("not found");
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // ignore: non_constant_identifier_names
  Widget TheNumbers({String ButtonText, Color color}) {
    return Expanded(
      child: OutlineButton(
        color: color,
        padding: EdgeInsets.all(24),
        child: Text(
          ButtonText,
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPressed(ButtonText)(ButtonText);
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
            alignment: Alignment.topRight,
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
              TheNumbers(ButtonText: "C", color: Colors.amber),
//              TheNumbers(ButtonText: "()", color: Colors.amber),
//              TheNumbers(ButtonText: "%", color: Colors.amber),
              TheNumbers(ButtonText: "/", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              TheNumbers(ButtonText: "7", color: Colors.white),
              TheNumbers(ButtonText: "8", color: Colors.white),
              TheNumbers(ButtonText: "9", color: Colors.white),
              TheNumbers(ButtonText: "X", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              TheNumbers(ButtonText: "4", color: Colors.white),
              TheNumbers(ButtonText: "5", color: Colors.white),
              TheNumbers(ButtonText: "6", color: Colors.white),
              TheNumbers(ButtonText: "-", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              TheNumbers(ButtonText: "1", color: Colors.white),
              TheNumbers(ButtonText: "2", color: Colors.white),
              TheNumbers(ButtonText: "3", color: Colors.white),
              TheNumbers(ButtonText: "+", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              TheNumbers(ButtonText: '0', color: Colors.white),
//              TheNumbers(ButtonText: '.', color: Colors.white),
              TheNumbers(ButtonText: "=", color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}
