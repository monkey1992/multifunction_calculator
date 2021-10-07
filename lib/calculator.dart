import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  String operate;
  int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("计算器")),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("请输入二进制数 A ", textAlign: TextAlign.center)),
              Expanded(child: TextField(keyboardType: TextInputType.number))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("请输入二进制数 B ", textAlign: TextAlign.center)),
              Expanded(child: TextField(keyboardType: TextInputType.number))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: RadioListTile<String>(
                value: "+",
                groupValue: this.operate,
                onChanged: (value) {
                  setState(() {
                    this.operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("加法"),
                selected: this.operate == "+",
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: "-",
                groupValue: this.operate,
                onChanged: (value) {
                  setState(() {
                    this.operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("减法"),
                selected: this.operate == "-",
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: "×",
                groupValue: this.operate,
                onChanged: (value) {
                  setState(() {
                    this.operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("乘法"),
                selected: this.operate == "×",
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: "÷",
                groupValue: this.operate,
                onChanged: (value) {
                  setState(() {
                    this.operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("除法"),
                selected: this.operate == "÷",
              )),
            ],
          ),
          Text("计算结果："),
          Row(
            children: [
              Expanded(child: Text("二进制", textAlign: TextAlign.center)),
              Expanded(child: Text(result.toString()))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("十进制", textAlign: TextAlign.center)),
              Expanded(child: Text(result.toString()))
            ],
          ),
        ],
      )),
    );
  }
}
