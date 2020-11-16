import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum MessageType {
  TEXT,
  IMAGE,
}

class MessageItem extends StatelessWidget {
  final String text;
  final String uid;
  final int timestamp;
  final Key key;
  final String type;
  MessageItem({
    @required this.text,
    @required this.uid,
    @required this.timestamp,
    @required this.key,
    @required this.type, // indicates if image or message
  });
  List<Widget> getlist(BuildContext ctx) {
    return [
      type == 'MessageType.TEXT'
          ? Bubble(
              margin: BubbleEdges.only(
                  top: 10,
                  bottom: 10,
                  left: uid == 'me' ? 0 : 5,
                  right: uid == 'me' ? 5 : 0),
              alignment: uid == 'me' ? Alignment.topRight : Alignment.topLeft,
              nipWidth: 8,
              nipHeight: 24,
              nip: uid == 'me' ? BubbleNip.rightTop : BubbleNip.leftTop,
              color: uid == 'me' ? Colors.grey.shade300 : Color(0xFF03144c),
              child: Column(
                  crossAxisAlignment: uid == 'me'
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: uid == 'me' ? Colors.black : Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        DateFormat('jm').format(
                          DateTime.fromMillisecondsSinceEpoch(timestamp),
                        ),
                        style: TextStyle(
                            fontSize: 12,
                            color: uid == 'me' ? Colors.black : Colors.white),
                      ),
                    ),
                  ]),
            )
          : text != 'null'
              ? Container(
                  alignment:
                      uid == 'me' ? Alignment.topRight : Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight:
                              uid == 'me' ? Radius.zero : Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft:
                              uid == 'me' ? Radius.circular(10) : Radius.zero,
                        ),
                        child: Image.network(
                          text,
                          scale: 0.5,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(ctx).size.width * 3 / 5,
                          height: MediaQuery.of(ctx).size.width * 3 / 5,
                          loadingBuilder: (_, widget, progress) {
                            if (progress == null) return widget;
                            return Center(
                              widthFactor: 2,
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          DateFormat('jm').format(
                            DateTime.fromMillisecondsSinceEpoch(timestamp),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  alignment:
                      uid == 'me' ? Alignment.topRight : Alignment.topLeft,
                  margin: EdgeInsets.all(15),
                  width: MediaQuery.of(ctx).size.width * 3 / 4,
                  height: MediaQuery.of(ctx).size.width * 3 / 4,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getlist(context),
    );
  }
}
