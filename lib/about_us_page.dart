import 'package:flutter/material.dart';

const KTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

void main() => runApp(AboutUs());

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About us",
          style: TextStyle(fontSize: 26),
        ),
      ),
      body:Column(
        children: <Widget>[
          Center(
            child: Image(
                image: NetworkImage(
                    'https://cdn.iconscout.com/icon/free/png-512/calculator-716-461701.png',
                    scale: 2)),
          ),
          Divider(height: 300,),
          Text("m.abdulrahman.hezam@gmail.com",style: KTextStyle,),

        ],
      )
    );
  }
}
