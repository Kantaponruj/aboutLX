import 'package:aboutlx/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
// anonymous user    that I can't fixed it.
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Sign In')
    //   ),
    //   body: Container(
    //     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    //     child: RaisedButton(
    //       child: Text('Sign in anonymous'),
    //       onPressed: () async {
    //         dynamic result = await _auth.signInAnonymous();
    //         if(result == null){
    //           print('error sign in');
    //         }else{
    //           print("sign in");
    //           print(result);
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}