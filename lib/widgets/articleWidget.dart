import 'package:energia_app/Providers/article_provider.dart';
import 'package:energia_app/Providers/comment_provider.dart';
import 'package:energia_app/models/articleModel.dart';
import 'package:flutter/material.dart';
import '../Providers/articles.dart';
import 'package:provider/provider.dart';

import 'articleListWidget.dart';

class ArticleWidget extends StatelessWidget {
  final List<ArticleModel> articleList =  [];
  // ProfileViewModel _profileViewModel = new ProfileViewModel();
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    // final articleData = Provider.of<Articles>(context);
    // final localListupcomming = articleData.upCommingArticles;
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


    // List<Widget> localListprev = [
    //   whiteContainerpre,
    //   whiteContainerpre,
    //   whiteContainerpre,
    //   whiteContainerpre,
    // ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Article(),
        ),
        ChangeNotifierProvider.value(
          value: Articles(),
        ),
        ChangeNotifierProvider.value(
          value: Comment(),
        ),
      ],
      child: Scaffold(
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
                        color: Theme.of(context).textSelectionTheme.selectionColor),
                  )),
              gradientContainer,
             ArticleListWidget(MediaQuery.of(context).size,false)
/*----------------------------------------------------------------------------------------------------------------------------------------------- */
              // /*
              // previous article part
              //  */
              // Container(
              //     margin: EdgeInsets.fromLTRB(mediaSize.width / 50, 0, 0, 0),
              //     child: Text(
              //       "Previous Articles",
              //       style: TextStyle(
              //           fontWeight: FontWeight.w900,
              //           fontSize: 17.0,
              //           color: Theme.of(context).textSelectionColor),
              //     )),
              // gradientContainer,
              // Container(
              //   height: 250,
              //   margin: EdgeInsets.only(top: 10.0),
              //   child: FutureBuilder<List<ArticleModel>>(
              //       future: _profileViewModel.getArticles(),
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           articleList = snapshot.data;
              //           return ListView.builder(
              //               scrollDirection: Axis.horizontal,
              //               itemCount: articleList.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return GestureDetector(
              //                   onTap: () => print("object"),
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius: BorderRadius.all(
              //                             Radius.circular(10.0))),
              //                     width: 250,
              //                     height: 250,
              //                     margin:
              //                         EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
              //                     child: Stack(
              //                       alignment: Alignment.bottomCenter,
              //                       children: <Widget>[
              //                         ClipRRect(
              //                           borderRadius:
              //                               BorderRadius.circular(10.0),
              //                           child: articleList[index].image_url ==
              //                                   ''
              //                               ? Image.asset(
              //                                   'assets/images/image.jpg',
              //                                   fit: BoxFit.cover,
              //                                   width: 250,
              //                                   height: 250,
              //                                 )
              //                               : Image.network(
              //                                   "${articleList[index].image_url}",
              //                                   fit: BoxFit.cover,
              //                                   width: double.infinity,
              //                                   height: double.infinity,
              //                                   loadingBuilder:
              //                                       (BuildContext context,
              //                                           Widget child,
              //                                           ImageChunkEvent
              //                                               loadingProgress) {
              //                                     if (loadingProgress == null)
              //                                       return child;
              //                                     return Image.asset(
              //                                       'assets/images/image.jpg',
              //                                       fit: BoxFit.cover,
              //                                       width: 250,
              //                                       height: 250,
              //                                     );
              //                                   },
              //                                 ),
              //                         ),
              //                         Container(
              //                           decoration: BoxDecoration(
              //                               color: Color.fromRGBO(
              //                                   246, 246, 246, 0.7),
              //                               borderRadius: BorderRadius.all(
              //                                   Radius.circular(8.0))),
              //                           height: 130,
              //                           padding: EdgeInsets.all(5.0),
              //                           child: Column(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.end,
              //                             children: <Widget>[
              //                               Text("${articleList[index].title}",
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                       color: Colors.black,
              //                                       fontSize: 18,
              //                                       fontWeight:
              //                                           FontWeight.bold)),
              //                               SizedBox(
              //                                 height: 10,
              //                               ),
              //                               Text("${articleList[index].body}",
              //                                   maxLines: 2,
              //                                   textAlign: TextAlign.start,
              //                                   style: TextStyle(
              //                                       color: Theme.of(context)
              //                                           .primaryColor,
              //                                       fontWeight:
              //                                           FontWeight.bold)),
              //                               SizedBox(
              //                                 height: 5,
              //                               ),
              //                             ],
              //                           ),
              //                         ),
              //                         Positioned(
              //                           child: Container(
              //                             alignment: Alignment.centerLeft,
              //                             decoration: BoxDecoration(
              //                                 color: Theme.of(context)
              //                                     .primaryColor,
              //                                 borderRadius: BorderRadius.only(
              //                                   bottomRight:
              //                                       Radius.circular(10.0),
              //                                   topRight: Radius.circular(10.0),
              //                                 )),
              //                             padding: EdgeInsets.all(8.0),
              //                             child: Text(
              //                               '${articleList[index].department}',
              //                               style: TextStyle(
              //                                 color: Colors.white,
              //                               ),
              //                             ),
              //                           ),
              //                           top: 50,
              //                           left: 0,
              //                           right: 150,
              //                           bottom: 195,
              //                         )
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               });
              //         }
              //         return Center(child: CircularProgressIndicator());
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
