import 'package:flutter/cupertino.dart';

class ChatRoom {
  final String id;
  final String title;
  final String lastMsg;
  final String lastMsgAutherId;
  final int date;
  final String member1Id;
  final String member2Id;
  final String member1ImgUrl;
  final String member2ImgUrl;

  ChatRoom({
    @required this.id,
    @required this.title,
    @required this.lastMsg,
    @required this.lastMsgAutherId,
    @required this.date,
    @required this.member1Id,
    @required this.member2Id,
    @required this.member1ImgUrl,
    @required this.member2ImgUrl,
  });
}
