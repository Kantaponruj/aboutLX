import 'package:flutter/material.dart';
import 'package:aboutlx/models/exhibition.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/screen/eventPage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:aboutlx/models/event.dart';

class EventListView extends StatefulWidget {

  var deviceData;
  Exhibition exhibition;
  EventListView(Exhibition e, var deviceData) {
    exhibition = e;
    this.deviceData = deviceData;
  }

  @override
  _EventListViewState createState() => _EventListViewState();
}

class _EventListViewState extends State<EventListView> {
  @override
  Widget build(BuildContext context) {

    final events = Provider.of<List<Event>>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: widget.deviceData.size.width,
      itemCount: widget.exhibition.events.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          MaterialPageRoute eventPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => eventPage(widget.exhibition.events[index],widget.deviceData));
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
                  WhiteTitleText(widget.exhibition.events[index].name),
                  WhiteTitleText(DateFormat.Hm()
                      .format(widget.exhibition.events[index].start) +
                      " to " +
                      DateFormat.Hm()
                          .format(widget.exhibition.events[index].end)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
