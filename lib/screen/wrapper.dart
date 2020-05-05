import 'package:aboutlx/authenticate/authenticate.dart';
import 'package:aboutlx/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
