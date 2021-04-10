import 'dart:ui';

import 'package:energia_app/models/articleModel.dart';
import 'package:energia_app/viewModels/ProfileViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleListWidget extends StatefulWidget {
  final Size size;

  ArticleListWidget(this.size);

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<ArticleListWidget> {
  List<ArticleModel> articleList = new List<ArticleModel>();
  ProfileViewModel _profileViewModel = new ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Container(
        width: widget.size.width,
        margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: FutureBuilder<List<ArticleModel>>(
                  future: _profileViewModel.getArticles(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      articleList = snapshot.data;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: articleList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => print("object"),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                width: 250,
                                height: 250,
                                margin:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: articleList[index].image_url == ''
                                          ? Image.asset(
                                              'assets/images/image.jpg',
                                              fit: BoxFit.cover,
                                              width: 250,
                                              height: 250,
                                            )
                                          : Image.network(
                                              "${articleList[index].image_url}",
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent
                                                          loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Image.asset(
                                                  'assets/images/image.jpg',
                                                  fit: BoxFit.cover,
                                                  width: 250,
                                                  height: 250,
                                                );
                                              },
                                            ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              246, 246, 246, 0.7),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      height: 130,
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text("${articleList[index].title}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("${articleList[index].body}",
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            )),
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          '${articleList[index].department}',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      top: 50,
                                      left: 0,
                                      right: 150,
                                      bottom: 195,
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget listitle(String text, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
      child: Row(
        children: <Widget>[
          icon,
          Text(text),
        ],
      ),
    );
  }
}
