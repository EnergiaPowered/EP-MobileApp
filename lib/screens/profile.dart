import 'dart:ui';

import 'package:energia_app/screens/edit_profile.dart';
import 'package:energia_app/viewModels/ProfileViewModel.dart';
import 'package:energia_app/widgets/eventListWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<Profile> {
  ProfileViewModel profileViewModel;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    profileViewModel = new ProfileViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget gradientContainer = Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Container(
          width: 120,
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
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => profileViewModel.goBack(context),
                  child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.0))),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      )),
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(EditProfile.routeName);
                      },
                      child: Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0))),
                          child: Icon(
                            Icons.edit,
                            size: 30,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0))),
                        child: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Image.asset(
                    'assets/images/person.jpg',
                    fit: BoxFit.cover,
                    height: 130.0,
                    width: 130.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mahmoud Alrashidi',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      'Mobile Div',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Article You Pinned",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      color: Theme.of(context).textSelectionColor),
                )),
            gradientContainer,
            Divider(),
            Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  "Events You interested",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      color: Theme.of(context).textSelectionColor),
                )),
            gradientContainer,
            EventListWidget(size),
          ],
        ),
      ),
    ));
  }
}
