import 'dart:ui';
import 'package:aboutlx/object/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/object/exhibition.dart';
import 'package:aboutlx/component/page.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  static List<Exhibition> e = [
    new Exhibition("SIT01","Yes, it is test",new Date(1, 1, 2020),[
      new Event("eat", "NO", "SIT01", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 10:00:00")),
      new Event("eat agian", "NO", "SIT01", DateTime.parse("2020-01-01 10:00:00"), DateTime.parse("2020-01-01 12:00:00")),
      new Event("sleep", "NO", "SIT01", DateTime.parse("2020-01-01 13:00:00"), DateTime.parse("2020-01-01 15:00:00")),
    ]),
    new Exhibition("SIT02","Yes, it is test",new Date(3, 4, 2020),[
      new Event("walk", "NO", "SIT02", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 10:00:00")),
      new Event("walk fast", "NO", "SIT02", DateTime.parse("2020-01-01 10:00:00"), DateTime.parse("2020-01-01 12:00:00")),
      new Event("run", "NO", "SIT02", DateTime.parse("2020-01-01 13:00:00"), DateTime.parse("2020-01-01 15:00:00")),
    ]),
    new Exhibition("SIT03","Yes, it is test",new Date(21, 6, 2020),[
      new Event("Learn", "NO", "SIT03", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 18:00:00")),
    ]),
  ];
  Icon searchIcon = Icon(Icons.search);
  Widget searchInput = Text("");
  final controller = PageController(initialPage: 0,);
  String date= e[0].date.monthInName()+", "+e[0].date.year.toString();
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    print(deviceData.size.width);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){},
          color: Color.fromRGBO(189, 189, 189, 1),
          icon: Icon(Icons.menu),
        ),
        title: searchInput,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              setState(() {
                if(this.searchIcon.icon == Icons.search)
                {
                  this.searchIcon = Icon(Icons.cancel);
                  this.searchInput = TextField(
                    cursorColor: Color.fromRGBO(240, 102, 74, 1),
                    style: TextStyle(fontSize: 16),

                  );
                }
                else
                {
                  this.searchIcon = Icon(Icons.search);
                  this.searchInput = Text("");
                }
              });
            },
            icon: searchIcon,
            color: Color.fromRGBO(189, 189, 189, 1),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SubTitleText(date),
                  TitleText("What exhibition we have?"),
                ],
              ),
              margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    date = e[index].date.monthInName()+", "+e[index].date.year.toString();
                    print(e[index].date.getDateTime());
                  });
                },
                controller: controller,
                itemCount: e.length,
                itemBuilder: (context,index){
                  return ExPage(e[index],deviceData);
                },
              ),
            )
          ],
        ),
      )
    );
  }
}