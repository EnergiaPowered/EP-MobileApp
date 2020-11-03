import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  static const routPage = '/eventdetailsscreen';

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    Widget gradientContainer = Container(
        margin: EdgeInsets.fromLTRB(mediaSize.width / 40, 0, 0, 0),
        child: Container(
          width: 60,
          height: 3,
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
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Theme.of(context).backgroundColor,
                spreadRadius: 5,
                blurRadius: 2)
          ]),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(
                        Icons.menu,
                        size: 30,
                        color: Theme.of(context).backgroundColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0, top: 5),
                    child: Text(
                      "Energia Power",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.notifications,
                        color: Theme.of(context).backgroundColor,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

      body:
          /*
          main column
        */
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
              Stack of The Top Widget with some information 
        */
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    mediaSize.width / 30,
                    mediaSize.height / 15,
                    mediaSize.width / 30,
                    mediaSize.height / 50),
                height: mediaSize.height / 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60)),
                ),
              ),
              Positioned(
                child: Image.asset(
                  'assets/images/articlepaper.png',
                  scale: 7,
                ),
              ),
              Positioned(
                  top: mediaSize.height / 5,
                  child: Text(
                    "Mobile Development",
                    style: TextStyle(color: Colors.white),
                  )),
              Positioned(
                bottom: mediaSize.height / 50,
                left: mediaSize.width / 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up_alt_outlined,
                          color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.textsms, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.push_pin_outlined, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          Divider(),
          /*
              Container Of Comments 
        */
          Container(
            height: 50,
          ),
          Divider(),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          /*
              Container Of Bottom informations 
        */
          Container(
            height: mediaSize.height / 2.35,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "Information",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            color: Theme.of(context).textSelectionColor),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Container(
                        width: mediaSize.width / 3,
                        height: mediaSize.height / 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [
                                0.3,
                                1
                              ],
                              colors: [
                                Theme.of(context).primaryColor,
                                Colors.white
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                    height: 130,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "About",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            color: Theme.of(context).textSelectionColor),
                      )),
                  gradientContainer,
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 5),
                    height: 130,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
