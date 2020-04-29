import 'package:aboutlx/object/event.dart';

class Exhibition{
  String name;
  String detail;
  Date date;
  List<Event> events;

  Exhibition(this.name, this.detail, this.date, this.events);

}

class Date{
  int day;
  int month;
  int year;

  Date(int d,int m,int y){
    day=d;
    month=m;
    year=y;
  }

  monthInName(){
    switch (month){
      case 1:{
        return "Jan";
      }break;
      case 2:{
        return "Feb";
      }break;
      case 3:{
        return "Mar";
      }break;
      case 4:{
        return "Apr";
      }break;
      case 5:{
        return "May";
      }break;
      case 6:{
        return "Jun";
      }break;
      case 7:{
        return "Jul";
      }break;
      case 8:{
        return "Aug";
      }break;
      case 9:{
        return "Sep";
      }break;
      case 10:{
        return "Oct";
      }break;
      case 11:{
        return "Nov";
      }break;
      case 12:{
        return "Dec";
      }break;
    }
  }

  getDateTime(){
    String m;
    String d;
    if(month<10)
      m = "0"+month.toString();
    else
      m = month.toString();
    if(day<10)
      d = "0"+day.toString();
    else
      d = day.toString();
    return DateTime.parse(year.toString()+"-"+m+"-"+d+" "+"00:00:00");
  }
}