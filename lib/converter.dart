import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Converter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConverterState();
  }
}

class ConverterState extends State<Converter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("进制转换器")),
      body: Center(),
    );
  }
}
