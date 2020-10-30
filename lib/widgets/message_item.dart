import 'package:bubble/bubble.dart';
import 'package:energia_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageItem extends StatelessWidget {
  final Message msg;
  MessageItem(this.msg);
  List<Widget> getlist(BuildContext ctx) {
    return [
      Container(
        padding: EdgeInsets.all(5.0),
        child: Text(
          DateFormat('jm').format(
            DateTime(msg.date),
          ),
        ),
      ),
      Expanded(
        child: Bubble(
          margin: BubbleEdges.only(
              top: 10,
              bottom: 10,
              left: msg.autherId == 'me' ? 0 : 5,
              right: msg.autherId == 'me' ? 5 : 0),
          alignment:
              msg.autherId == 'me' ? Alignment.topRight : Alignment.topLeft,
          nipWidth: 8,
          nipHeight: 24,
          nip: msg.autherId == 'me' ? BubbleNip.rightTop : BubbleNip.leftTop,
          color:
              msg.autherId == 'me' ? Colors.grey.shade300 : Color(0xFF03144c),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(ctx).size.width * 2 / 3),
            child: Text(
              msg.body,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color: msg.autherId == 'me' ? Colors.black : Colors.white,
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
      children: msg.autherId == 'me'
          ? getlist(context)
          : getlist(context).reversed.toList(),
    );
  }
}
