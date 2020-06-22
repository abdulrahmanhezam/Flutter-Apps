import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,  home: HomePage(), );
  }
}

class HomePage extends StatefulWidget {
  //  "HomePage"الكلاس الرئيسي هو
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = ""; // متغير لتخزين العمليات في الاله الحاسبة

  String _output = ""; // يقوم باخراج العمليات الحسابية
  double num1 = 0.0; //  متغير لتخزين الرقم الاول
  double num2 = 0.0; // متغير لتخزين الرقم الثاني
  String operand = ""; // متغير يخزن العمليات الحسابية كاالضرب والطرح

  buttonPressed(String buttonText) {
    // الدالة ما ترجع اي قيمة 
	// تقوم الدالة باستقبال نص عبارة عن نص الزر 
	// تقوم الدالة ب جميع العمليات الحسابية داخل التطبيق
	
	// buttonText  متغير نصي الهدف ان يحتوي على قيمة النص للازرار
	
    if (buttonText == "C") {
      // السي هنا اختصار لكلمة clear وتعني مسح جميع البيانات السابقة 
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      _output = "";
    } else if (buttonText == "+" || 
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") { // هنا شرط ازرار العمليات الحسابية 
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == '.') {
      // اذا الرقم يحتوي على  "." من الاساس  ما يحتاج فاصلة اخرى
      if (_output.contains('.')) {
        print("Already Contains");
        return;
      } else {
        _output = buttonText;
      }
    } else if (buttonText == '=') {
      // شرط عملية المساواة
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString(); // شرط عملية الجمع
      }
      if (operand == "-") {
        _output = (num1 - num2).toString(); // شرط عملية الطرح
      }
      if (operand == "X") {
        _output = (num1 * num2).toString(); // شرط عملية الضرب
      }
      if (operand == "/") {
        _output = (num1 / num2).toString(); // شرط عملية القسمه
        if (num2 == 0) {
          // اذا كانت القسمه على على صفر الناتج غير معرف"notDefined"
          _output = "Division by zero is not defined!";
        }
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText; 
    }
	
    print(_output);
    setState(() {
      output = _output; // تقوم بعرض العمليات  اعلى
    });
  }

  // ignore: non_constant_identifier_names
  Widget theNumbers({String ButtonText, Color color}) {
  
    //  هنا نقوم بعمل الزر
    return Expanded(
      child: OutlineButton(
        // نوع الزر المستخدم
        color: color,
        padding: EdgeInsets.all(24),
        child: Text(
          ButtonText,
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          buttonPressed(
              ButtonText); // هنا نقوم باستدعاء  دالة العمليات داخل الزر
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //  هنا نقوم بتصميم الشكل الخارجي
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Calculator '), // هنا نقوم بوضع عنوان التطبيق في اعلى الصفحة
      ),
      body: Column(
        children: <Widget>[
          Container(
            //  هنا حيث شاشة عرض المخرجات
            padding: EdgeInsets.all(28),
            alignment: Alignment.topRight,
            child: Text(
              output,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: new Divider(
            color: Colors.black,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,),
          ),

          // هنا ترتيب الازرار على شكل صفوف
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
