import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/articleWidget.dart';
import '../widgets/eventsWidget.dart';
import '../widgets/homeWidget.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  //////////////////////////////////////////////////////////
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    EventsWidget(),
    ArticleWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 35,
            color: Theme.of(context).backgroundColor,
          ),
          Icon(
            Icons.event,
            size: 35,
            color: Theme.of(context).backgroundColor,
          ),
          Icon(
            Icons.library_books,
            size: 35,
            color: Theme.of(context).backgroundColor,
          ),
        ],
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).backgroundColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _children[_currentIndex],
    );
  }
}
