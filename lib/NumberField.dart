import 'package:flutter/material.dart';

class NumTextField extends StatefulWidget {
  String nameField ;
  double input1 ; //saved in provider
  double input2 ;
  NumTextField([this.nameField]);

  @override
  _NumTextFieldState createState() => _NumTextFieldState();
}

class _NumTextFieldState extends State<NumTextField> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: ButtonTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          child: TextField(
            cursorColor: Colors.blue,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter ${widget.nameField} Number",
              hintStyle: TextStyle(
                  fontStyle: FontStyle.italic, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              labelText: '${widget.nameField}',
              labelStyle: TextStyle(
                decorationColor: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
              filled: false,
            ),
            onChanged: (userName) {
              setState(() {
                widget.nameField=='First' ? widget.input1 = double.parse(userName)
                    : widget.input2 = double.parse(userName);
              });
            },
          )),
    );
  }
}

