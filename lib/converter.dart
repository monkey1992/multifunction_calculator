import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multifunction_calculator/constants.dart';
import 'package:multifunction_calculator/utils.dart';

class Converter extends StatefulWidget {
  final String type;

  const Converter({Key key, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConverterState();
  }
}

class _ConverterState extends State<Converter> {
  String _typeName;
  String _textFieldError;
  int _a = 0;
  int _result;

  int _parseNumber(String number) {
    return parseNumber(widget.type, number);
  }

  bool isVisible(String type) {
    return type != widget.type;
  }

  @override
  void initState() {
    super.initState();
    _result = _a;
    _typeName = getTypeName(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$_typeName转换器")),
      body: Center(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text("请输入$_typeName数 ", textAlign: TextAlign.center)),
              Expanded(
                  child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value == null || value.isEmpty) {
                    this.setState(() {
                      _textFieldError = null;
                      _a = 0;
                    });
                  } else {
                    int result = _parseNumber(value);
                    if (result == null) {
                      this.setState(() {
                        _textFieldError = "请输入合法的$_typeName数";
                      });
                    } else {
                      this.setState(() {
                        _textFieldError = null;
                        _a = result;
                      });
                    }
                  }
                },
                decoration: InputDecoration(
                    hintText: "请输入$_typeName数", errorText: _textFieldError),
              ))
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("开始转换"),
            onPressed: () {
              if (_textFieldError != null) {
                Fluttertoast.showToast(msg: "请输入合法的$_typeName数");
                return;
              }
              this.setState(() {
                _result = _a;
              });
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(100, 20, 100, 20))),
          ),
          SizedBox(height: 50),
          Row(children: [Text("转换结果：", textAlign: TextAlign.left)]),
          SizedBox(height: 50),
          Visibility(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("二进制", textAlign: TextAlign.center)),
                      Expanded(child: Text(_result.toRadixString(2)))
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
              visible: isVisible(Constants.type2)),
          Visibility(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("八进制", textAlign: TextAlign.center)),
                      Expanded(child: Text(_result.toRadixString(8)))
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
              visible: isVisible(Constants.type8)),
          Visibility(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("十进制", textAlign: TextAlign.center)),
                      Expanded(child: Text(_result.toString()))
                    ],
                  ),
                  SizedBox(height: 20)
                ],
              ),
              visible: isVisible(Constants.type10)),
          Visibility(
              child: Column(
                children: [
                  Row(children: [
                    Expanded(child: Text("十六进制", textAlign: TextAlign.center)),
                    Expanded(child: Text(_result.toRadixString(16)))
                  ])
                ],
              ),
              visible: isVisible(Constants.type16)),
        ],
      )),
    );
  }
}
