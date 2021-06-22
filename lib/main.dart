import 'package:flutter/material.dart';
import 'package:life_website/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHEDOOR.NET',
      theme: ThemeData(
        primarySwatch: Colors.blue,fontFamily: 'GuDianMingChao'
      ),
      home: MyHomePage(),
    );
  }
}
