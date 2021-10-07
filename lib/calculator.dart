import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  static const String operateAdd = "+";
  static const String operateSubtract = "-";
  static const String operateMultiply = "×";
  static const String operateDivide = "÷";
  String _operate;
  int _a;
  int _b;
  int _result;

  @override
  void initState() {
    super.initState();
    _operate = operateAdd;
  }

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
                value: operateAdd,
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text(operateAdd),
                subtitle: Text("加"),
                selected: this._operate == operateAdd,
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: operateSubtract,
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text(operateSubtract),
                subtitle: Text("减"),
                selected: this._operate == operateSubtract,
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: operateMultiply,
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text(operateMultiply),
                subtitle: Text("乘"),
                selected: this._operate == operateMultiply,
              )),
              Expanded(
                  child: RadioListTile<String>(
                value: operateDivide,
                groupValue: this._operate,
                onChanged: (value) {
                  setState(() {
                    this._operate = value;
                  });
                },
                title: Text(operateDivide),
                subtitle: Text("除"),
                selected: this._operate == operateDivide,
              )),
            ],
          ),
          ElevatedButton(
              child: Text("计算"),
              onPressed: () {
                this.setState(() {
                  if (_operate == operateAdd) {
                    _result = _a + _b;
                  } else if (_operate == operateSubtract) {
                    _result = _a - _b;
                  } else if (_operate == operateMultiply) {
                    _result = (_a * _b);
                  } else if (_operate == operateDivide) {
                    if (_b != 0) {
                      _result = _a ~/ _b;
                    }
                  }
                });
                Fluttertoast.showToast(
                    msg: "计算 $_a $_operate $_b 的结果为：$_result");
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
