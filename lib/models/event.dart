import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
  String id;
  String name;
  String detail;
  String exhibition;
  DateTime start;
  DateTime end;
  String room;

  Event({this.id, this.name, this.detail, this.exhibition, this.start, this.end, this.room});

//  addToDB() async{
//    await Firestore.instance.collection('events').add({
//      'name': name,
//      'detail' : detail,
//      'exhibition' : exhibition,
//      'start' : start,
//      'end' : end,
//      'room' : room,
//    });
//  }
}