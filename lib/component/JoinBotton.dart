import 'package:provider/provider.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/models/event.dart';
import 'package:aboutlx/models/user.dart';
import 'package:aboutlx/models/JoinedEvent.dart';
import 'package:aboutlx/services/databaseService.dart';
import 'package:flutter/material.dart';

class JoinBotton extends StatelessWidget {
  Event event;
  User user;
  var deviceData;

  JoinBotton({this.event,this.deviceData,this.user});
  @override
  Widget build(BuildContext context) {
    final joinEvent = Provider.of<List<JoinedEvent>>(context);
    JoinedEvent userJoin = event.getUserJoin(joinEvent);
    if(user.isAnon){
      return InkWell(
        child: Container(
          width: deviceData.size.width,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color:Color.fromRGBO(189, 189, 189, 1),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WhiteTitleText("Need to log in"),
                ],
              ),
            ),
          ),
        ),
      );
    }else if(userJoin==null){
      return InkWell(
        onTap: () async {
          print("Join it");
          dynamic result = await DatabaseService(uid: user.uid).join(event.id);
        },
        child: Container(
          width: deviceData.size.width,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color:Color.fromRGBO(240, 102, 74, 1),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WhiteTitleText("Join"),
                ],
              ),
            ),
          ),
        ),
      );
    }
    else{
      return InkWell(
        onTap: () async {
          print("Join it");
          dynamic result = await DatabaseService(uid: user.uid).unJoin(userJoin);
        },
        child: Container(
          width: deviceData.size.width,
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color:Color.fromRGBO(240, 102, 74, 0.3),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleText("Un Join"),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
