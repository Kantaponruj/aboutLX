import 'package:aboutlx/component/historyCard.dart';
import 'package:flutter/material.dart';

class history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        title: Text("History"),
      ),

      body: Column(
        children: <Widget>[
          new historyCard(),
          new historyCard(),
        ],
      )
      
    );

  }
}