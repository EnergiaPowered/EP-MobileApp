import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/Providers/comment_provider.dart';
import 'package:energia_app/widgets/addComment_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './expandedarticles.dart';
import '../widgets/localdrawer.dart';
import '../Providers/article_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/likeb_comment_adge.dart';
import '../widgets/comment_widget.dart';
import '../Providers/articles.dart';

class ArticleDetailsScreen extends StatefulWidget {
  static const routPage = '/articledetailsscreen';

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  String articleId;

  String currentUser;

  String userImage;

  String userPhone;

  Future<void> getCurrentUser() async {
    //FirebaseUser currentu = await FirebaseAuth.instance.currentUser;
    //print(currentu.uid);
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot ds = await user.doc("01114988158").get();
    String userName =
        await ds.get("first_name") + " " + await ds.get("last_name");
    String userph = await ds.get("phone");
    String userimg = await ds.get("image_url");

    currentUser = userName;
    userPhone = userph;
    userImage = userimg;
  }

  @override
  void initState() {
    getCurrentUser();
    Provider.of<Articles>(context, listen: false).fetchAndSetComments("1");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    //final articleData = Provider.of<Article>(context);
    // List<> comments =[];
    // final articlesData = Provider.of<Articles>(context);
    final modalData = ModalRoute.of(context).settings.arguments;
    articleId = modalData;
    // final clickedArticle =
    //     articlesData.findFromUpCommingArticlesById(modalData);

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
              style: Theme.of(context).appBarTheme.textTheme.headline6),
        ),
      ),

      /*----------------------------------------------------------------------------------------------------------------------------------------------- */

      body:
          /*
          main screen column
        */
          MultiProvider(
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
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            //articlesData.fetchAndSetComments("1");
            print("change");
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*
                          Stack of The Top Widget with some information 
                    */
                InkWell(
                  onTap: () => Navigator.of(context)
                      .pushNamed(ExpandedArticles.routPage),
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
                            "Mobile Development $modalData",
                            style: TextStyle(color: Colors.white),
                          )),
                      Positioned(
                        bottom: mediaSize.height / 50,
                        left: mediaSize.width / 30,
                        child: Consumer<Article>(
                          builder: (ctx, article, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () => article.toggleLike(),
                                  icon: Icon(Icons.thumb_up,
                                      color: article.isLiked
                                          ? Colors.blue
                                          : Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Icon(Icons.textsms, color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.fiber_pin,
                                      color: Colors.white),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

                Divider(),
                FutureBuilder(
                    future: Provider.of<Articles>(context, listen: false)
                        .fetchAndSetComments("1"),
                    builder: (ctx, ss) {
                      if (ss.connectionState == ConnectionState.done) {
                        return Container(
                            height: mediaSize.height * 0.1,
                            /*
                              Comments
                              .........
                            */
                            child: Consumer<Articles>(
                                builder: (ctx, articlesData, child) {
                              print(
                                  "in Builder ${ss.data.length}");

                              return ListView.builder(
                                itemCount: ss.data.length,
                                itemBuilder: (ct, index) {
                                  print("i listen");
                                  return CommentWidget(
                                      comment:
                                          ss.data[index].comment,
                                      image: ss.data[index].userPhoto,
                                      name: ss.data[index].name);
                                },
                              );
                            }));
                      } else {
                        return Center(
                            child:
                                Container(child: CircularProgressIndicator()));
                      }
                    }),
                Divider(),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

                Container(
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
                              margin:
                                  EdgeInsets.only(left: mediaSize.width / 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CircleAvatar(
                                    radius: 7,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(mediaSize.width / 30),
                              width: 280,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.blueGrey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mediaSize.height / 23,
                        ),
                        AddComment(
                          image: userImage,
                          name: currentUser,
                          articleId: modalData,
                          phone: "0112836813",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
