import 'package:aboutlx/authenticate/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}