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
  String _operate;
  int _a;
  int _b;
  int _result;

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
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  this.setState(() {
                    _a = int.parse(value);
                  });
                },
              ))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("请输入二进制数 B ", textAlign: TextAlign.center)),
              Expanded(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        this.setState(() {
                          _b = int.parse(value);
                        });
                      }))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: RadioListTile<String>(
                value: "+",
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("加法"),
                selected: this._operate == "+",
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: "-",
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("减法"),
                selected: this._operate == "-",
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: "×",
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("乘法"),
                selected: this._operate == "×",
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: "÷",
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text("+"),
                subtitle: Text("除法"),
                selected: this._operate == "÷",
              )),
            ],
          ),
          ElevatedButton(
              child: Text("计算"),
              onPressed: () {
                this.setState(() {
                  _result = _a + _b;
                });
                Fluttertoast.showToast(msg: "计算 $_a + $_b 的结果为：$_result");
              }),
          Text("计算结果："),
          Row(
            children: [
              Expanded(child: Text("二进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toString()))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("十进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toString()))
            ],
          ),
        ],
      )),
    );
  }
}
