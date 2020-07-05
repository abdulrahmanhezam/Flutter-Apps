import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark(),

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //  "HomePage"الكلاس الرئيسي هو
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 divByZero(String message) async => Fluttertoast.showToast( //  تقوم هذه الدالة باظهار تنبيه عند القسمة على صفر
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 16.0);

  String output = ""; // متغير لتخزين العمليات في الاله الحاسبة

  String _output = ""; // يقوم باخراج العمليات الحسابية
  double num1 = 0; //  متغير لتخزين الرقم الاول
  double num2 = 0; // متغير لتخزين الرقم الثاني
  String operand = ""; // متغير يخزن العمليات الحسابية كاالضرب والطرح

  buttonPressed(String buttonText) {
    // الدالة ما ترجع اي قيمة
    // تقوم الدالة باستقبال نص عبارة عن نص الزر
    // تقوم الدالة ب جميع العمليات الحسابية داخل التطبيق

    // buttonText  متغير نصي الهدف ان يحتوي على قيمة النص للازرار

    if (buttonText == "C") {
      // السي هنا اختصار لكلمة clear وتعني مسح جميع البيانات السابقة
      num1 = 0;
      num2 = 0;
      operand = "";
      _output = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X" ||
        buttonText == "%") {
      // هنا شرط ازرار العمليات الحسابية
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (operand == "%") {
      _output = (num1 / 100).toString();
    }
    else if (buttonText == '=') {
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
          _output = divByZero("يتعذر القسمة على صفر.") as String;
        }
      }
      num1 = 0;
      num2 = 0;
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
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: FlatButton(
          // نوع الزر المستخدم
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: color,
          padding: EdgeInsets.all(22),
          child: Text(
            ButtonText,
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          onPressed: () {
            buttonPressed(ButtonText);
            // هنا نقوم باستدعاء  دالة العمليات داخل الزر
          },
        ),
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
          Expanded(
            child: Container(
              //  هنا حيث شاشة عرض المخرجات
              padding: EdgeInsets.all(8),
              alignment: Alignment.topRight,
              child: Text(
                output.trim(),
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          // هنا ترتيب الازرار على شكل صفوف
          Row(
            children: <Widget>[
              theNumbers(ButtonText: "C", color: Colors.amber),
//              TheNumbers(ButtonText: "()", color: Colors.amber),
              theNumbers(ButtonText: "%", color: Colors.amber),
              theNumbers(ButtonText: "/", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              theNumbers(ButtonText: "7", color: Colors.white38),
              theNumbers(ButtonText: "8", color: Colors.white38),
              theNumbers(ButtonText: "9", color: Colors.white38),
              theNumbers(ButtonText: "X", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              theNumbers(ButtonText: "4", color: Colors.white38),
              theNumbers(ButtonText: "5", color: Colors.white38),
              theNumbers(ButtonText: "6", color: Colors.white38),
              theNumbers(ButtonText: "-", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              theNumbers(ButtonText: "1", color: Colors.white38),
              theNumbers(ButtonText: "2", color: Colors.white38),
              theNumbers(ButtonText: "3", color: Colors.white38),
              theNumbers(ButtonText: "+", color: Colors.amber),
            ],
          ),
          Row(
            children: <Widget>[
              theNumbers(ButtonText: '0', color: Colors.amber),
              theNumbers(ButtonText: '.', color: Colors.amber),
              theNumbers(ButtonText: "=", color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}
