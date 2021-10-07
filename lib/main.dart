import 'package:flutter/material.dart';
import 'package:multifunction_calculator/calculator.dart';
import 'package:multifunction_calculator/constants.dart';
import 'package:multifunction_calculator/converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '进制计算器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '进制计算器'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final List<HomeMenu> products = [
    HomeMenu('二进制计算器', '二进制计算器'),
    HomeMenu('八进制计算器', '八进制计算器'),
    HomeMenu('十进制计算器', '十进制计算器'),
    HomeMenu('十六进制计算器', '十六进制计算器'),
    HomeMenu('二进制转换器', '二进制转换器'),
    HomeMenu('八进制转换器', '八进制转换器'),
    HomeMenu('十进制转换器', '十进制转换器'),
    HomeMenu('十六进制转换器', '十六进制转换器')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              onTap: () {
                HomeMenu homeMenu = products[index];
                String id = homeMenu.id;
                if (id == '二进制计算器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Calculator(type: Constants.type2)));
                } else if (id == '八进制计算器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Calculator(type: Constants.type8)));
                } else if (id == '十进制计算器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Calculator(type: Constants.type10)));
                } else if (id == '十六进制计算器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Calculator(type: Constants.type16)));
                } else if (id == '二进制转换器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Converter(type: Constants.type2)));
                } else if (id == '八进制转换器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Converter(type: Constants.type8)));
                } else if (id == '十进制转换器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Converter(type: Constants.type10)));
                } else if (id == '十六进制转换器') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Converter(type: Constants.type16)));
                }
              },
            );
          }),
    );
  }
}

class HomeMenu {
  String id;
  String title;

  HomeMenu(this.id, this.title);
}
