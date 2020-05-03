import 'package:flutter/material.dart';
import 'package:aboutlx/screen/home.dart';
import 'authenticate/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Color.fromRGBO(240, 102, 74, 1),
        fontFamily: 'Mitr',
      ),
      home: home(),
    );
  }
}