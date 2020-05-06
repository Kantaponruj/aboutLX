import 'dart:ui';
import 'package:aboutlx/component/drawer.dart';
import 'package:aboutlx/models/event.dart';
import 'package:aboutlx/models/user.dart';
import 'package:aboutlx/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aboutlx/component/text_style.dart';
import 'package:aboutlx/models/exhibition.dart';
import 'package:aboutlx/component/page.dart';

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
  static List<Exhibition> e = [
    new Exhibition("SIT01",s,new Date(1, 1, 2020),"images/DSC_0019.jpg",[
      new Event("Eat", "NO", "SIT01", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 10:00:00"),"A01"),
      new Event("Eat Agian", "NO", "SIT01", DateTime.parse("2020-01-01 10:00:00"), DateTime.parse("2020-01-01 12:00:00"),"A02"),
      new Event("Sleep", "NO", "SIT01", DateTime.parse("2020-01-01 13:00:00"), DateTime.parse("2020-01-01 15:00:00"),"A03"),
    ]),
    new Exhibition("SIT02",s,new Date(3, 4, 2020),"images/DSC_0019.jpg",[
      new Event("Walk", "NO", "SIT02", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 10:00:00"),"A01"),
      new Event("Walk fast", "NO", "SIT02", DateTime.parse("2020-01-01 10:00:00"), DateTime.parse("2020-01-01 12:00:00"),"A02"),
      new Event("Run", "NO", "SIT02", DateTime.parse("2020-01-01 13:00:00"), DateTime.parse("2020-01-01 15:00:00"),"A03"),
    ]),
    new Exhibition("SIT03",s,new Date(21, 6, 2020),"images/DSC_0019.jpg",[
      new Event("Learn", "NO", "SIT03", DateTime.parse("2020-01-01 08:00:00"), DateTime.parse("2020-01-01 18:00:00"),"A02"),
    ]),
  ];
  Icon searchIcon = Icon(Icons.search);
  Widget searchInput = Text("");
  final controller = PageController(initialPage: 0,);
  String date= e[0].date.monthInName()+", "+e[0].date.year.toString();

  @override
  void initState() {
    super.initState();
    _auth.signInAnon();
    print("Auto anon");
  }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    print("re build");
    return Scaffold(
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