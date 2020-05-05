import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:aboutlx/component/text_style.dart';

class historyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const ListTile(
                leading: GFAvatar(
                  backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/proxy/AY_3pA38hgpd8QTPlP0Z3c6dn1Erv355lmiKv7LczIGokhs88SjnbTjZtV8KDqfQsHg8P8KZ_zedxUdYb-lcSxRs1OBgSqYCw_hZdPCyLKs2qbN9aOhoPKhupSeoq4oG0mVhUKT3x4AB"),
                  shape: GFAvatarShape.square,
                  size: 50.0,
                ),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
