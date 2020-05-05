import 'package:aboutlx/models/user.dart';
import 'package:aboutlx/screen/wrapper.dart';
import 'package:aboutlx/services/auth.dart';
import 'package:aboutlx/screen/history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: Color.fromRGBO(240, 102, 74, 1),
          fontFamily: 'Mitr',
        ),
        home: Wrapper(),
      ),
    );
  }
}