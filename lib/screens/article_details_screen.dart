import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatefulWidget {
  static const routPage = '/articledetailsscreen';

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  
  @override
  Widget build(BuildContext context) {
    Widget gradientContainer = Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 70, 10, 10),
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60)),
                ),
              ),
            ],
          ),
          Divider(),
          Container(
            height: 50,
          ),
          Divider(),
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "Contents",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            color: Theme.of(context).textSelectionColor),
                      )),
                 gradientContainer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 280,
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blueGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
