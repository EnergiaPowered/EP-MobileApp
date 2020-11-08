import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageItem extends StatelessWidget {
  final String text;
  final String uid;
  final int timestamp;
  final Key key;
  MessageItem({
    @required this.text,
    @required this.uid,
    @required this.timestamp,
    @required this.key,
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
        child: Bubble(
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
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * 2 / 3),
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: uid == 'me' ? Colors.black : Colors.white,
              ),
            ),
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
