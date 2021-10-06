import 'package:flutter/material.dart';
import 'package:multifunction_calculator/calculator.dart';
import 'package:multifunction_calculator/converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '多功能计算器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Multifunction Calculator Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final List<HomeMenu> products = [
    HomeMenu('计算器', '计算器'),
    HomeMenu('进制转换器', '进制转换器')
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
                if (id == '计算器') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Calculator()));
                } else if (id == '进制转换器') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Converter()));
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
