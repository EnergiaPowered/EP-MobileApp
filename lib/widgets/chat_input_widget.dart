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
  bool _isEmojiOpened = false;
  String _textMessage = '';
  bool isKeyboardOpened = false;
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
    _textMessage = '';
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

  Widget _openEmojis(BuildContext context) {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      buttonMode: ButtonMode.MATERIAL,
      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        setState(() {
          _textMessage += emoji.emoji;
          _textController.text = _textMessage;
        });
      },
    );
  }

  Future<bool> onBackPress() {
    if (_isEmojiOpened) {
      setState(() {
        _isEmojiOpened = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.only(left: 7.0, right: 7.0, bottom: 10.0),
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
                  onPressed: () {
                    setState(() {
                      _isEmojiOpened = !_isEmojiOpened;
                      if (isKeyboardOpened) {
                        FocusScope.of(context).unfocus();
                        isKeyboardOpened = !isKeyboardOpened;
                      }
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      maxLines: 6,
                      minLines: 1,
                      expands: false,
                      autocorrect: true,
                      onTap: () {
                        isKeyboardOpened = true;
                        setState(() {
                          _isEmojiOpened = false;
                        });
                      },
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
                    color: _textMessage.trim().isNotEmpty
                        ? Color(0xFF03144c)
                        : Colors.grey,
                  ),
                  onPressed: _textMessage.trim().isEmpty
                      ? null
                      : () {
                          sendMessage(_textMessage, MessageType.TEXT);
                        },
                ),
              ],
            ),
            _isEmojiOpened
                ? SingleChildScrollView(
                    child: _openEmojis(context),
                    scrollDirection: Axis.horizontal,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
