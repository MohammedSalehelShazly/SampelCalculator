import 'package:flutter/material.dart';

import 'NumberField.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}
class _CalculatorState extends State<Calculator> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text("Calculator", style: TextStyle(fontSize: MediaQuery.textScaleFactorOf(context)*30,)),
        centerTitle: true,
      ),
      body: ButtonClass(),
    );
  }
}

clear() {

}
// clear button not run




class ButtonClass extends StatefulWidget {
  @override
  __buttonState createState() => __buttonState();
}

class __buttonState extends State<ButtonClass> {

  String result = "";


  double input1, input2;
  moveData(){
    NumTextField obj = NumTextField() ;
    setState(() {
      input1 = obj.input1 ;
      input2 = obj.input2 ;
    });
    print('$input1 .. $input2');
  }
  @override
  void initState() {
    moveData();
    super.initState();
  }


  @override

  Widget buttonFunc(String mark){
    return RaisedButton(
      child: Text(
        "$mark",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      color: Colors.blue,
      onPressed: () {
        setState(() {
          moveData();
          switch(mark){
            case "+" : return result=(input1+input2).toInt().toString();
            case "-" : return result=(input1-input2).toInt().toString();
            case "*" : return result=(input1*input2).toInt().toString();
            case "/" : return (input1%input2) !=0 ? result = (input1 / input2).toString() : result = (input1 ~/ input2).toInt().toString();
          }
          return result;
        });
      },
    );
  }
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              NumTextField('First'),
              NumTextField('Second'),
              Theme(
                  data: ThemeData(
                      buttonTheme: ButtonThemeData(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            buttonFunc("+"),
                            buttonFunc("-"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            buttonFunc("*"),
                            buttonFunc("/"),
                          ],
                        ),
                      ],
                    ), //return Row contain (+,-,*,/) buttons
                  )),
              /*Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ButtonTheme(
                  minWidth: 300,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton(
                    child: Text(
                      "C",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        input1 = input2 = 0;
                      });
                    },
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FloatingActionButton.extended(
                  label: Text(
                    "$result",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  onPressed: ()=>null,
                  icon: Icon(Icons.question_answer),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
