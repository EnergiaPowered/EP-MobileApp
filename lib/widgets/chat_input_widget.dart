import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatInputWidget extends StatefulWidget {
  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final _textController = new TextEditingController();

  String _textMessage = '';

  final chatRef = FirebaseFirestore.instance.collection('chats');

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Icons.insert_emoticon,
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
                onChanged: (text) {
                  setState(() {
                    _textMessage = text;
                  });
                },
                controller: _textController,
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
              Icons.camera_alt,
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
            onPressed: _textMessage.trim().isEmpty
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    _textController.clear();
                    chatRef.add(
                      {
                        'text': _textMessage.trim(),
                        'date': -DateTime.now().millisecondsSinceEpoch,
                        'uid': 'me' /**TODO change to uid */
                      },
                    );
                  },
          ),
        ],
      ),
    );
  }
}
