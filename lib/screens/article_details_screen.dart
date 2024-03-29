import 'package:energia_app/models/articleModel.dart';
import 'package:flutter/material.dart';
import '../widgets/localdrawer.dart';

class ArticleDetailsScreen extends StatefulWidget {
  static const routPage = '/articledetailsscreen';
  final ArticleModel? articleModel;

  const ArticleDetailsScreen({Key? key, this.articleModel}) : super(key: key);

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    // Widget gradientContainer = Container(
    //     margin: EdgeInsets.fromLTRB(mediaSize.width / 40, 0, 0, 0),
    //     child: Container(
    //       width: 60,
    //       height: 3,
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.centerLeft,
    //             end: Alignment.centerRight,
    //             stops: [0.3, 1],
    //             colors: [Theme.of(context).primaryColor, Colors.white]),
    //         borderRadius: BorderRadius.all(Radius.circular(30)),
    //       ),
    //     ));
    return Scaffold(
      drawer: LocalDrawer(),
      appBar: AppBar(
        toolbarHeight: mediaSize.height / 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text("Article Details",
            style: Theme.of(context).appBarTheme.textTheme!.headline6),
        centerTitle: true,
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
          // Stack(
          //   alignment: Alignment.topCenter,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.fromLTRB(
          //           mediaSize.width / 30,
          //           mediaSize.height / 15,
          //           mediaSize.width / 30,
          //           mediaSize.height / 50),
          //       height: mediaSize.height / 4,
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).primaryColor,
          //         borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(60),
          //             topLeft: Radius.circular(60)),
          //       ),
          //     ),
          //     Positioned(
          //       child: Image.asset(
          //         'assets/images/articlepaper.png',
          //         scale: 7,
          //       ),
          //     ),
          //     Positioned(
          //         top: mediaSize.height / 5,
          //         child: Text(
          //           widget.department,
          //           style: TextStyle(color: Colors.white),
          //         )),
          //     Positioned(
          //       bottom: mediaSize.height / 50,
          //       left: mediaSize.width / 30,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           IconButton(
          //             onPressed: () {},
          //             icon: Icon(Icons.thumb_up, color: Colors.white),
          //           ),
          //           IconButton(
          //             onPressed: () {},
          //             icon: Icon(Icons.textsms, color: Colors.white),
          //           ),
          //           IconButton(
          //             onPressed: () {},
          //             icon: Icon(Icons.fiber_pin, color: Colors.white),
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          //   Divider(),
          //   /*
          //       Container Of Comments
          // */
          //   Container(
          //     height: 50,
          //   ),
          //   Divider(),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          /*
              Container Of Bottom informations 
        */
          Container(
            height: mediaSize.height * 0.88,
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
                            color: Theme.of(context).textSelectionTheme.selectionColor),
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Title:${widget.articleModel!.title}',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Content:${widget.articleModel!.body}',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   'EventLocation:${widget.eventLocation}',
                          //   style: TextStyle(color: Colors.white, fontSize: 18),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   'EventOrganizer:${widget.eventOrganizer}',
                          //   style: TextStyle(color: Colors.white, fontSize: 18),
                          // ),
                          SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
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
