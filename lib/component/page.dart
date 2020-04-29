import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/object/exhibition.dart';
import 'package:aboutlx/exhibitionPage.dart';

class ExPage extends StatelessWidget {
  int page;
  var deviceData;
  Exhibition exhibition;
  ExPage(Exhibition e, var deviceData) {
    exhibition = e;
    this.deviceData = deviceData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              MaterialPageRoute exhibitionPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => exhibitionPage(exhibition,deviceData));
              Navigator.of(context).push(exhibitionPageRoute);
            },
            child: Container(
              margin: EdgeInsets.all(30),
              child: Material(
                  color: Color.fromRGBO(240, 102, 74, 1),
                  borderRadius: BorderRadius.circular(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Container(
                          width: deviceData.size.width,
                          height: deviceData.size.width / 1.8,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/DSC_0019.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: WhiteTitleText(
                            exhibition.name,
                          )),
                    ],
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SubTitleText("Event of this exhibition"),
                TitleText(exhibition.date.monthInName() + " " + exhibition.date.day.toString() + ", " + exhibition.date.year.toString()),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: deviceData.size.width,
                itemCount: exhibition.events.length,
                itemBuilder: (context, index) => Container(
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
                    )
            ),
          ),
        ],
      ),
    );
  }
}
