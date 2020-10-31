import 'dart:ui';
import 'package:energia_app/widgets/articleListWidget.dart';
import 'package:energia_app/widgets/eventListWidget.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget gradientContainer = Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.3, 1],
                colors: [Theme.of(context).primaryColor, Colors.white]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  "Recent Events",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      color: Theme.of(context).textSelectionColor),
                )),
            gradientContainer,
            EventListWidget(size),
            Divider(),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Recent Article",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      color: Theme.of(context).textSelectionColor),
                )),
            gradientContainer,
            ArticleListWidget(size),
//            Container(
//              margin: EdgeInsets.fromLTRB(50, 10, 0, 10),
//              height: 195,
//              decoration: BoxDecoration(
//                color: Theme.of(context).primaryColor,
//                borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(30),
//                    topLeft: Radius.circular(30)),
//              ),


          ],
        ),
      ),
    );
  }
}
