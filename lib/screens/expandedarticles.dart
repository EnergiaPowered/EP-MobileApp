/* When we Pressed in one article to expand it */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpandedArticles extends StatefulWidget {
  static const routPage = 'expandedarticles';
  @override
  _ExpandedArticlesState createState() => _ExpandedArticlesState();
}

class _ExpandedArticlesState extends State<ExpandedArticles> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: mediaSize.width / 20),
                    child: Container(
                      width: mediaSize.width / 10,
                      height: mediaSize.height / 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                            onPressed: () => Navigator.of(context).pop()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: mediaSize.width / 20),
                    child: Container(
                      width: mediaSize.width / 10,
                      height: mediaSize.height / 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]),
                      child: IconButton(
                          icon: Icon(
                            Icons.fiber_pin,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: null),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Image.asset("assets/images/articlepaper.png"),
                ],
              ),
              Divider(),
              Container(
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.thumb_up,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'Like',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.textsms,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'Comment',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.zoom_out_map,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            'Expand',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
