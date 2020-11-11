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
      Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          DateFormat('jm').format(
            DateTime.fromMillisecondsSinceEpoch(timestamp),
          ),
        ),
      ),
      Expanded(
        child: type == 'MessageType.TEXT'
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
                child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(ctx).size.width * 2 / 3),
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: uid == 'me' ? Colors.black : Colors.white,
                      ),
                    )),
              )
            : text != 'null'
                ? Container(
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
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
                  )
                : Container(
                    margin: EdgeInsets.all(15),
                    width: MediaQuery.of(ctx).size.width * 3 / 4,
                    height: MediaQuery.of(ctx).size.width * 3 / 4,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          uid == 'me' ? getlist(context) : getlist(context).reversed.toList(),
    );
  }
}
