import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final String image;
  final String comment;
  final String name;
  CommentWidget({this.image, this.comment, this.name});
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Container(
      height: mediaSize.height / 9,
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            //child: Image.network(image),
            backgroundImage: NetworkImage(image),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            height: mediaSize.height * .07,
            width: mediaSize.width * .8,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style:
                            Theme.of(context).appBarTheme.textTheme.headline6),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 13.0, right: 13, top: 2),
                        child: Text(
                          comment,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
