import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:energia_app/widgets/send_image.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ChatInputWidget extends StatefulWidget {
  var channelId;
  var curren_email;
  var current_uid;
  var other_uid;
  ChatInputWidget(this.channelId,this.curren_email,this.current_uid,this.other_uid);
  @override
  _ChatInputWidgetState createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _textController = new TextEditingController();
  bool _isEmojiShown = false;
  String _textMessage = '';
  bool _isKeyboardShown = false;
  final _chatRef = FirebaseFirestore.instance.collection('chats');
  /* void _sendMessage(String text, MessageType type) {
    if (type == MessageType.TEXT) {
      FocusScope.of(context).unfocus();
      _textController.clear();
      _chatRef.add(
        {
          'text': text.trim(),
          'date': DateTime.now().millisecondsSinceEpoch,
          'uid': 'me',
          *//**TODO change to uid *//*
          'type': 'MessageType.TEXT',
        },
      );
    } else {
      _uploadImage(text);
    }
    _textMessage = '';
  }

  void _uploadImage(String path) async {
    DocumentReference docRef = await _chatRef.add(
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
      _chatRef.doc(docRef.id).update({'text': fileURL});
    });
  }
*/


  Widget get _emojiPicker {
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

  Future<bool> _onBackPress() {
    if (_isEmojiShown) {
      setState(() {
        _isEmojiShown = false;
      });
    } else {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  Future _hideKeyboard() async {
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
    await Future.delayed(Duration(milliseconds: 100));
  }

  void _onEmojiIconPressed() async {
    await _hideKeyboard();
    if (_isKeyboardShown) {
      FocusScope.of(context).unfocus();
    }
    _isKeyboardShown = false;
    setState(() {
      _isEmojiShown = !_isEmojiShown;
    });
  }

  void _hideEmojiPicker() {
    if (_isEmojiShown)
      setState(() {
        _isEmojiShown = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPress,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.only(left: 7.0, right: 7.0, bottom: 10.0, top: 5.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SendImage(widget.current_uid,widget.channelId,
                    widget.curren_email,widget.other_uid),
                Expanded(
                  child: Container(
                    child: TextField(
                      maxLines: 6,
                      minLines: 1,
                      expands: false,
                      autocorrect: true,
                      onTap: () {
                        _hideEmojiPicker();
                        _isKeyboardShown = true;
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
                ///   ChatImagePicker(_sendMessage),
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

                    firestore
                        .collection('ChatChannel')
                        .doc(widget.channelId)
                        .collection('messages')
                        .add({
                      'message': _textMessage,
                      'type': 'text',
                      'data': DateTime.now().toIso8601String().toString(),
                      'sederEmail': widget.curren_email,
                    }).whenComplete(() {

                    }).then((value) => _textController.clear());
                    ///  _sendMessage(_textMessage, MessageType.TEXT);
                  },
                ),
              ],
            ),
            _isEmojiShown
                ? SingleChildScrollView(
              child: _emojiPicker,
              scrollDirection: Axis.horizontal,
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
