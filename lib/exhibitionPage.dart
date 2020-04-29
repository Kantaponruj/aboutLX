import 'package:flutter/material.dart';
import 'package:aboutlx/object/exhibition.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:intl/intl.dart';

class exhibitionPage extends StatefulWidget {
  Exhibition exhibition;
  var deviceData;
  exhibitionPage(this.exhibition,this.deviceData);
  @override
  _exhibitionPageState createState() => _exhibitionPageState(exhibition,deviceData);
}

class _exhibitionPageState extends State<exhibitionPage> {
  Exhibition exhibition;
  var deviceData;
  _exhibitionPageState(this.exhibition,this.deviceData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
//        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Exhibition Info"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleText.withSize(exhibition.name,20),
                  SubTitleText(exhibition.date.monthInName() + " " + exhibition.date.day.toString() + ", " + exhibition.date.year.toString()),
                  SizedBox(height: 10,),
                  Text(exhibition.detail),
                ],
              ),
            ),
            SizedBox(
              height: deviceData.size.height/3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: deviceData.size.width,
                  itemCount: exhibition.events.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(30),
                    height: 100,
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
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
