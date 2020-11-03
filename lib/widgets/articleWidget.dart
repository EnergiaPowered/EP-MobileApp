import 'package:flutter/material.dart';
import '../screens/article_details_screen.dart';

class ArticleWidget extends StatefulWidget {
  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    /* whiteContaier is a contaner apove the moveCotainer */
    Widget gradientContainer = Container(
        margin: EdgeInsets.fromLTRB(mediaSize.width / 40, 0, 0, 0),
        child: Container(
          width: 80,
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
    Widget whiteContainerup = Container(
        width: mediaSize.width/1.4,
        //color: Colors.red,
        child: Stack(
          //alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(mediaSize.width/10, mediaSize.height/50, mediaSize.width/20, mediaSize.height/500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: mediaSize.height / 30,
              left: mediaSize.width / 6.5,
              child: Image.asset(
                'assets/images/pp.png',
                scale: 15,
              ),
            ),
            Positioned(
              top: mediaSize.height / 10.1,
              left: mediaSize.width / 10,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(mediaSize.width / 40,
                              mediaSize.height / 80, 0, 0),
                          child: Text(
                            "Contents",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
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
                            margin: EdgeInsets.only(left: mediaSize.width / 25),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              ],
                            ),
                          ),
                          /* To write towards bolits write code here */
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: mediaSize.width / 10,
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/articlepaper.png',
                  scale: 9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));

    

    Widget whiteContainerpre = Container(
        width: mediaSize.width/1.4,
        //color: Colors.red,
        child: Stack(
          //alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(mediaSize.width/10, mediaSize.height/50, mediaSize.width/100, mediaSize.height/50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: mediaSize.height / 20,
              left: mediaSize.width / 6.5,
              child: Image.asset(
                'assets/images/pp.png',
                scale: 15,
              ),
            ),
            Positioned(
              top: mediaSize.height / 10.1,
              left: mediaSize.width / 10,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(mediaSize.width / 40,
                              mediaSize.height / 30, 0, 0),
                          child: Text(
                            "Contents",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
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
                            margin: EdgeInsets.only(left: mediaSize.width / 25),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              ],
                            ),
                          ),
                          /* To write towards bolits write code here */
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: mediaSize.width / 15,
              top: mediaSize.height / 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/articlepaper.png',
                  scale: 9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
    List<Widget> localListupcomming = [
      whiteContainerup,
      whiteContainerup,
      whiteContainerup,
      whiteContainerup,
    ];
    List<Widget> localListprev = [
      whiteContainerpre,
      whiteContainerpre,
      whiteContainerpre,
      whiteContainerpre,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /*
            upcomming article part
             */
            Container(
                margin: EdgeInsets.fromLTRB(
                    mediaSize.width / 50, mediaSize.height / 60, 0, 0),
                child: Text(
                  "Upcoming Articles",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      color: Theme.of(context).textSelectionColor),
                )),
            gradientContainer,
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(mediaSize.width / 30,
                      mediaSize.height / 40, mediaSize.width / 30, 10),
                  height: mediaSize.height / 3.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                ),
                Positioned(
                  top: mediaSize.height / 24,
                  left: mediaSize.width / 6,
                  right: mediaSize.width / 6,
                  child: InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(ArticleDetailsScreen.routPage),
                    child: Container(
                      width: mediaSize.width / 1,
                      height: mediaSize.height / 4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: localListupcomming.length,
                        itemBuilder: (context, i) {
                          return localListupcomming[i];
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */
            /*
            previous article part
             */
            Container(
                margin: EdgeInsets.fromLTRB(mediaSize.width / 50, 0, 0, 0),
                child: Text(
                  "Previous Articles",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0,
                      color: Theme.of(context).textSelectionColor),
                )),
            gradientContainer,
            Container(
              width: mediaSize.width / 1.1,
              child: Container(
                margin: EdgeInsets.only(left: mediaSize.width / 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: localListupcomming.length,
                    itemBuilder: (context, i) {
                      return localListprev[i];
                    }),
              ),
              margin: EdgeInsets.fromLTRB(
                  mediaSize.width / 7, mediaSize.height / 60, 0, 0),
              height: mediaSize.height / 3.3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    topLeft: Radius.circular(60)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
