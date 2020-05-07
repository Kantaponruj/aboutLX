import 'package:aboutlx/models/event.dart';
import 'package:aboutlx/models/exhibition.dart';
import'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  final bool isAnon;

  DatabaseService({this.uid,this.isAnon});


  final CollectionReference eventCollection = Firestore.instance.collection('events');
  List<Event> _eventFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Event(
        doc.data["name"],
        doc.data["detail"],
        doc.data["exhibition"],
        (doc.data["start"] as Timestamp).toDate(),
        (doc.data["end"] as Timestamp).toDate(),
        doc.data["room"],
      );
    }).toList();
  }
  Stream<List<Event>> get events{
    return eventCollection.snapshots().map(_eventFromSnapshot);
  }

  final CollectionReference exhibitionCollection = Firestore.instance.collection('exhibitions').orderBy('date');
  List<Exhibition> _exhibitionFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Exhibition(
        doc.documentID,
        doc.data["name"],
        doc.data["detail"],
        doc.data["date"],
        "images/DSC_0019.jpg",
      );
    }).toList();
  }
  Stream<List<Exhibition>> get exhibitions{
    return exhibitionCollection.snapshots().map(_exhibitionFromSnapshot);
  }


}