import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("Null"),
            ),
            accountName: Text("Not log in"),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Map"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Schrdule"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("History"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text("QR Scan"),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
