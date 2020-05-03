import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
       // Set the transparency here
       canvasColor: Colors.white.withOpacity(0.8), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),

      child : Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://cdn4.iconfinder.com/data/icons/e-commerce-181/512/477_profile__avatar__man_-512.png")
                        )
                    )), 
            new Text('Guest',
            style: TextStyle(
              fontWeight: FontWeight.w500 ,
              fontSize: 20.0
            ),
            ) ,
            ],
          ),
          ),
          ListTile(
            leading: Icon(Icons.near_me),
            title: Text('Map'),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification'),
            onTap: (){
              
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text('QR Code'),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Schedule'),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            onTap: (){
              
            },
          ),
        ],
      ) ,
      ),
      );
  }
}