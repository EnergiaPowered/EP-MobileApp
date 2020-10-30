import 'package:energia_app/models/chat_room.dart';
import 'package:energia_app/screens/inbox_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatRoomItem extends StatelessWidget {
  final ChatRoom room;
  ChatRoomItem(this.room);
  String get roomImgUrl {
    if (room.member1Id == 'me') // change with user id
      return room.member1ImgUrl;
    return room.member2ImgUrl;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          InBoxMessages.routeName,
          arguments: room,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(3.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,borderRadius: BorderRadius.circular(2)),
                    child: Image.network(roomImgUrl,)),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      room.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Anton',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        room.lastMsg,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Text(DateFormat('MEd').format(DateTime.now()).toString(),
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
