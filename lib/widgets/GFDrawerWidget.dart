import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

class GFDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          GFDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            currentAccountPicture: GFAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Fetuccini'),
                Text('user@userid.com'),
              ],
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: null,
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
