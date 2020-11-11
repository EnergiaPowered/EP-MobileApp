import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:energia_app/widgets/chat_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../widgets/message_item.dart';

class ChatInputWidget extends StatefulWidget {
  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final _textController = new TextEditingController();
  String _textMessage = '';
  final chatRef = FirebaseFirestore.instance.collection('chats');
  void sendMessage(String text, MessageType type) {
    if (type == MessageType.TEXT) {
      FocusScope.of(context).unfocus();
      _textController.clear();
      chatRef.add(
        {
          'text': text.trim(),
          'date': DateTime.now().millisecondsSinceEpoch,
          'uid': 'me',
          /**TODO change to uid */
          'type': 'MessageType.TEXT',
        },
      );
    } else {
      _uploadImage(text);
    }
  }

  void _uploadImage(String path) async {
    DocumentReference docRef = await chatRef.add(
      {
        'text': 'null',
        'date': DateTime.now().millisecondsSinceEpoch,
        'uid': 'me',
        /**TODO change to uid */
        'type': 'MessageType.IMAGE',
      },
    );
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('chats').child('me').child(path);
    StorageUploadTask uploadTask = storageReference.putFile(File(path));
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((fileURL) {
      chatRef.doc(docRef.id).update({'text': fileURL});
    });
  }

  Widget _openEmojis() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      buttonMode: ButtonMode.MATERIAL,
      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        print(emoji);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.only(left: 7.0, right: 7.0, bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.all(5),
                  icon: Icon(
                    Icons.insert_emoticon,
                    size: 35,
                    color: Colors.grey,
                  ),
                  onPressed: _openEmojis,
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
                ChatImagePicker(sendMessage),
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
                          sendMessage(_textMessage, MessageType.TEXT);
                        },
                ),
              ],
            ),
            // SingleChildScrollView(child: _openEmojis()),
          ],
        ),
      ),
    );
  }
}
