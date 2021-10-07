import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Calculator extends StatefulWidget {
  static const String type2 = "type2";
  static const String type8 = "type8";
  static const String type10 = "type10";
  static const String type16 = "type16";

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

  int _parseNumber(String number) {
    int radix;
    String type = widget.type;
    if (type == Calculator.type2) {
      radix = 2;
    } else if (type == Calculator.type8) {
      radix = 8;
    } else if (type == Calculator.type16) {
      radix = 16;
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
    } else if (type == Calculator.type8) {
      _typeName = "八进制";
    } else if (type == Calculator.type16) {
      _typeName = "十六进制";
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
                  if (value == null || value.isEmpty) {
                    this.setState(() {
                      _textFieldAError = null;
                      _a = 0;
                    });
                  } else {
                    int result = _parseNumber(value);
                    if (result == null) {
                      this.setState(() {
                        _textFieldAError = "请输入合法的$_typeName数";
                      });
                    } else {
                      this.setState(() {
                        _textFieldAError = null;
                        _a = result;
                      });
                    }
                  }
                },
                decoration: InputDecoration(
                    hintText: "请输入$_typeName数", errorText: _textFieldAError),
              ))
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                  child:
                      Text("请输入$_typeName数 B ", textAlign: TextAlign.center)),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value == null || value.isEmpty) {
                    this.setState(() {
                      _textFieldBError = null;
                      _b = 0;
                    });
                  } else {
                    int result = _parseNumber(value);
                    if (result == null) {
                      this.setState(() {
                        _textFieldBError = "请输入合法的$_typeName数";
                      });
                    } else {
                      this.setState(() {
                        _textFieldBError = null;
                        _b = result;
                      });
                    }
                  }
                },
                decoration: InputDecoration(
                    hintText: "请输入$_typeName数", errorText: _textFieldBError),
              ))
            ],
          ),
          SizedBox(height: 20),
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
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("开始计算"),
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
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(100, 20, 100, 20))),
          ),
          SizedBox(height: 50),
          Row(children: [Text("计算结果：", textAlign: TextAlign.left)]),
          SizedBox(height: 50),
          Row(
            children: [
              Expanded(child: Text("二进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toRadixString(2)))
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("八进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toRadixString(8)))
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text("十进制", textAlign: TextAlign.center)),
              Expanded(child: Text(_result.toString()))
            ],
          ),
          SizedBox(height: 20),
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
