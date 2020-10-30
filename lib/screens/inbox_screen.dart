import 'package:energia_app/models/message.dart';
import 'package:energia_app/widgets/message_item.dart';
import 'package:flutter/material.dart';

class InBoxMessages extends StatelessWidget {
  static const String routeName = '/inbox-screen';
  final messagesDemo = [
    Message('hey there how are you mane ? how are things', 'me',
        DateTime.now().millisecond),
    Message('hey there', 'him', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'him', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'him', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
    Message('hey there', 'me', DateTime.now().millisecond),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admins'),
        leading: Image.network(
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg,'),
      ),
      body: messagesDemo == null || messagesDemo.length == 0
          ? Center(
              child: Text('No messages, type a message !'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: new ScrollController(initialScrollOffset: 0.0),
                    itemCount: messagesDemo.length,
                    reverse: true,
                    itemBuilder: (_, idx) {
                      return MessageItem(messagesDemo[idx]);
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20.0)),
                  margin: EdgeInsets.only(left: 7.0, right: 7.0, bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          size: 35,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            maxLines: 6,
                            minLines: 1,
                            expands: false,
                            autocorrect: true,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              border: InputBorder.none,
                              hintText: 'type a message',
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: 35,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.all(5),
                        icon: Icon(
                          Icons.send,
                          size: 35,
                          color: Color(0xFF03144c),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
