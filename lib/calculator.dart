import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calculator extends StatefulWidget {
  static const String type2 = "type2";
  static const String type10 = "type10";

  final String type;

  const Calculator({Key key, this.type}) : super(key: key);

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

  String _typeName;
  String _operate;
  String _textFieldAError;
  String _textFieldBError;
  int _a = 0;
  int _b = 0;
  int _result;

  int _convertNumber(String number) {
    int radix;
    if (widget.type == Calculator.type2) {
      radix = 2;
    } else {
      radix = 10;
    }
    return int.tryParse(number, radix: radix);
  }

  @override
  void initState() {
    super.initState();
    _operate = operateAdd;
    _result = _a + _b;
    String type = widget.type;
    if (type == Calculator.type2) {
      _typeName = "二进制";
    } else {
      _typeName = "十进制";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$_typeName计算器")),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child:
                      Text("请输入$_typeName数 A ", textAlign: TextAlign.center)),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  int result = _convertNumber(value);
                  if (result == null) {
                    _textFieldAError = "请输入合法的$_typeName数";
                  } else {
                    _textFieldAError = null;
                    this.setState(() {
                      _a = result;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText: "请输入$_typeName数", errorText: _textFieldAError),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child:
                      Text("请输入$_typeName数 B ", textAlign: TextAlign.center)),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  int result = _convertNumber(value);
                  if (result == null) {
                    _textFieldBError = "请输入合法的$_typeName数";
                  } else {
                    _textFieldBError = null;
                    this.setState(() {
                      _b = result;
                    });
                  }
                },
                decoration: InputDecoration(
                    hintText: "请输入$_typeName数", errorText: _textFieldBError),
              ))
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
                if (_textFieldAError != null) {
                  Fluttertoast.showToast(msg: "请输入合法的$_typeName数 A");
                  return;
                }
                if (_textFieldBError != null) {
                  Fluttertoast.showToast(msg: "请输入合法的$_typeName数 B");
                  return;
                }
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
              }),
          Text("计算结果："),
          Row(
            children: [
              Expanded(child: Text("二进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toRadixString(2)))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("八进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toRadixString(8)))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("十进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toString()))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("十六进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toRadixString(16)))
            ],
          ),
        ],
      )),
    );
  }
}
