import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("计算器")),
      body: Center(

      ),
    );
  }
}
