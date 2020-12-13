import 'package:energia_app/Providers/articles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddComment extends StatelessWidget {
  final String image;
  final String name;
  final String articleId;
  final String phone;
  AddComment({this.image, this.name, this.articleId, this.phone});
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final articlesData = Provider.of<Articles>(context, listen: false);
    final _commentController = TextEditingController();

    void onSubmitt() {
      print("one step");
      articlesData.addComment(
          _commentController.text, phone, articleId, image, name).then((value) => articlesData.fetchAndSetComments("1"));
      
    }

    return Container(
      height: mediaSize.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 5,
            ),
            height: mediaSize.height * .07,
            width: mediaSize.width * .8,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: TextField(
                        controller: _commentController,
                        onSubmitted: (_) => _commentController.text == "" ||
                                _commentController.text == null
                            ? null
                            : onSubmitt(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: InputBorder.none,
                          hintText: 'Add Comment',
                        ),
                      ),
                      padding: EdgeInsets.only(left: 5),
                    )
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {
              _commentController.text == "" || _commentController.text == null
                  ? FocusScope.of(context).requestFocus(new FocusNode())
                  : onSubmitt();
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.grey),
    );
  }
}
