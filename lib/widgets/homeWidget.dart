import 'dart:ui';

import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text("Recent Events",style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                    color: Theme.of(context).textSelectionColor
                ),)),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Divider(color: Theme.of(context).primaryColor,
              endIndent: 240.0,
              thickness: 5.0,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 10, 0, 10),

              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topLeft: Radius.circular(30)),
              ),

            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text("Recent Article",style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                    color: Theme.of(context).textSelectionColor
                ),)),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Divider(color: Theme.of(context).primaryColor,
                endIndent: 230.0,
                thickness: 5.0,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 10, 0, 10),

              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topLeft: Radius.circular(30)),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
