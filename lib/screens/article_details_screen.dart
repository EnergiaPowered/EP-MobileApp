import 'package:energia_app/screens/expandedarticles.dart';
import 'package:energia_app/widgets/localdrawer.dart';
import 'package:energia_app/widgets/localdrawer.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatefulWidget {
  static const routPage = '/articledetailsscreen';

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
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
      drawer: LocalDrawer(),
      appBar: AppBar(
        toolbarHeight: mediaSize.height / 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: mediaSize.width / 5),
          child: Text("Articles",
              style: Theme.of(context).appBarTheme.textTheme.title),
        ),
      ),

      /*----------------------------------------------------------------------------------------------------------------------------------------------- */

      body:
          /*
          main screen column
        */
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
                Stack of The Top Widget with some information 
          */
          InkWell(
            onTap: () =>
                Navigator.of(context).pushNamed(ExpandedArticles.routPage),
            child: Stack(
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
                        icon: Icon(Icons.thumb_up, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.textsms, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.fiber_pin, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          Divider(),
          Container(
            height: 50,
            /*
                Comments
                .........
              */
          ),
          Divider(),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          mediaSize.width / 40, mediaSize.height / 80, 0, 0),
                      child: Text(
                        "Contents",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                            color: Theme.of(context).textSelectionColor),
                      )),
                  gradientContainer,
                  /*
                      Row Of bottom informations 
                    */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: mediaSize.width / 15),
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
                        margin: EdgeInsets.all(mediaSize.width / 30),
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
