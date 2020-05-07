import 'dart:ui';
import 'package:aboutlx/component/drawer.dart';
import 'package:aboutlx/models/event.dart';
import 'package:aboutlx/models/user.dart';
import 'package:aboutlx/screen/exhibitionPage.dart';
import 'package:aboutlx/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/models/exhibition.dart';
import 'package:aboutlx/component/page.dart';
import 'package:aboutlx/services/databaseService.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  bool isAnon;
  Home({this.isAnon});
  @override
  _homeState createState() => _homeState(isAnon: isAnon);
}

class _homeState extends State<Home> {

  final AuthService _auth = AuthService();
  bool isAnon;
  User user ;

  _homeState({this.isAnon});

  static String s = "Yes, it is testYes, it is testYes, it is testYes, it is testYes, it is testYes, it is test Yes, it is testYes, it is testYes, it is testYes, it is testYes, it is testYes, it is test";
  static List<Event> events = [
    new Event("Eat", "NO", "1", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 10:00:00"),"A01"),
    new Event("Eat Agian", "NO", "1", DateTime.parse("2020-01-01 10:00:00"), DateTime.parse("2020-01-01 12:00:00"),"A02"),
    new Event("Sleep", "NO", "1", DateTime.parse("2020-01-01 13:00:00"), DateTime.parse("2020-01-01 15:00:00"),"A03"),
    new Event("Walk", "NO", "2", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 10:00:00"),"A01"),
    new Event("Walk fast", "NO", "2", DateTime.parse("2020-01-01 10:00:00"), DateTime.parse("2020-01-01 12:00:00"),"A02"),
    new Event("Run", "NO", "2", DateTime.parse("2020-01-01 13:00:00"), DateTime.parse("2020-01-01 15:00:00"),"A03"),
    new Event("Learn", "NO", "3", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 18:00:00"),"A02"),
  ];
  static List<Exhibition> exhibition = [
    new Exhibition("1","SIT01",s,new Date(1, 1, 2020),"images/DSC_0019.jpg"),
    new Exhibition("2","SIT02",s,new Date(3, 4, 2020),"images/DSC_0019.jpg"),
    new Exhibition("3","SIT03",s,new Date(21, 6, 2020),"images/DSC_0019.jpg"),
  ];
  Icon searchIcon = Icon(Icons.search);
  Widget searchInput = Text("");
  final controller = PageController(initialPage: 0,);
//  List<Exhibition> exhibition = Exhibition.getAllExhibition();
  @override
  void initState() {
    super.initState();
    _auth.signInAnon();
    print("Intit state start here");
    for(int i=0 ; i<exhibition.length ; i++){
      exhibition[i].setEvents(events);
      exhibition[i].addToDB();
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    print("re build");
    String date= exhibition[0].date.monthInName()+", "+exhibition[0].date.year.toString();
    return StreamProvider<List<Event>>.value(
      value: DatabaseService().events,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: searchInput,
          iconTheme: new IconThemeData(color: Color.fromRGBO(189, 189, 189, 1)),

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
            ),
          ],
        ),
        drawer: DrawerMenu(isAnon),
        
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
                      date = exhibition[index].date.monthInName()+", "+exhibition[index].date.year.toString();
                      print(exhibition[index].date.getDateTime());
                    });
                  },
                  controller: controller,
                  itemCount: exhibition.length,
                  itemBuilder: (context,index){
                    return ExPage(exhibition[index],deviceData);
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}