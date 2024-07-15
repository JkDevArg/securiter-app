import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class WGFTabBar extends StatefulWidget {
  const WGFTabBar({super.key});

  @override
  _WGFTabBarState createState() => _WGFTabBarState();
}

class _WGFTabBarState extends State<WGFTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GFTabs(
          length: 3,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_bike),
              child: Text("Tab1"),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
              child: Text("Tab2"),
            ),
            Tab(
              icon: Icon(Icons.directions_railway),
              child: Text("Tab3"),
            ),
          ],
          tabBarView: GFTabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(child: Icon(Icons.directions_bike), color: Colors.red),
              Container(child: Icon(Icons.directions_bus), color: Colors.blue),
              Container(child: Icon(Icons.directions_railway), color: Colors.orange),
            ],
          ),
        ),
        GFSegmentTabs(
          tabController: _tabController,
          length: 3,
          tabs: <Widget>[
            Text("Segment1"),
            Text("Segment2"),
            Text("Segment3"),
          ],
        ),
      ],
    );
  }
}
