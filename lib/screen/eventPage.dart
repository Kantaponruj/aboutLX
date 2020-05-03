import 'package:flutter/material.dart';
import 'package:aboutlx/object/event.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:intl/intl.dart';

class eventPage extends StatefulWidget {
  Event event;
  var deviceData;
  eventPage(this.event,this.deviceData);
  @override
  _eventPageState createState() => _eventPageState(event,deviceData);
}

class _eventPageState extends State<eventPage> {
  Event event;
  var deviceData;
  _eventPageState(this.event,this.deviceData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
//        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Event Info"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText.withSize(event.name,20),
                    SubTitleText(DateFormat.Hm().format(event.start)+" - "+DateFormat.Hm().format(event.end)),
                    SubTitleText("Room: "+event.room),
                    SizedBox(height: 10,),
                    Text(event.detail),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
