import 'package:flutter/material.dart';
import 'package:aboutlx/models/exhibition.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/screen/eventPage.dart';
import 'package:intl/intl.dart';

class EventListView extends StatelessWidget {

  var deviceData;
  Exhibition exhibition;
  EventListView(Exhibition e, var deviceData) {
    exhibition = e;
    this.deviceData = deviceData;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: deviceData.size.width,
      itemCount: exhibition.events.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          MaterialPageRoute eventPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => eventPage(exhibition.events[index],deviceData));
          Navigator.of(context).push(eventPageRoute);
        },
        child: Container(
          padding: EdgeInsets.all(30),
          child: Material(
            borderRadius: BorderRadius.circular(10.0),
            color:
            index % 2 == 0 ? Colors.orange : Colors.amberAccent,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WhiteTitleText(exhibition.events[index].name),
                  WhiteTitleText(DateFormat.Hm()
                      .format(exhibition.events[index].start) +
                      " to " +
                      DateFormat.Hm()
                          .format(exhibition.events[index].end)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
