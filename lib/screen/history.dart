import 'package:flutter/material.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/component/page.dart';
import 'package:aboutlx/component/drawer.dart';

class history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Container(
        child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Row 1
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.blue, height: 40, width: 40, child: Text('1')),
              Container(
                color: Colors.blue, height: 40, width: 40, child: Text('2')),
              Container(
                color: Colors.blue, height: 40, width: 40, child: Text('3')),
            ],
          ),
        ],
      )
      )
    );

  }
}