import 'package:energia_app/models/chat_room.dart';
import 'package:energia_app/models/message.dart';
import 'package:energia_app/widgets/message_item.dart';
import 'package:flutter/material.dart';

class InBoxScreen extends StatelessWidget {
  static const String routeName = '/inbox-screen';
  final messagesDemo = [
    {
      'chatId': '1',
      'messages': [
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
      ]
    },
    {
      'chatId': '5',
      'messages': [
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'him', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'him', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'him', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
      ]
    },
    {
      'chatId': '4',
      'messages': [
        Message('hey there', 'me', DateTime.now().millisecond),
      ]
    },
    {
      'chatId': '2',
      'messages': [
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'him', DateTime.now().millisecond),
        Message('hey there', 'him', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
      ]
    },
    {
      'chatId': '3',
      'messages': [
        Message('hey there', 'me', DateTime.now().millisecond),
        Message('hey there', 'me', DateTime.now().millisecond),
      ]
    },
    {
      'chatId': '6',
      'messages': [
        Message('hey there', 'me', DateTime.now().millisecond),
      ]
    },
    {
      'chatId': '7',
      'messages': [
        Message('hey there', 'me', DateTime.now().millisecond),
      ]
    },
  ];
  List<Message> chatMsgs(String chatId) {
    for (Map<String, Object> chat in messagesDemo) {
      if (chat['chatId'] == chatId) return (chat['messages']);
    }
    return null;
  }

  String roomImgUrl(ChatRoom room) {
    if (room.member1Id == 'me') // change with user id
      return room.member1ImgUrl;
    return room.member2ImgUrl;
  }

  @override
  Widget build(BuildContext context) {
    ChatRoom room = ModalRoute.of(context).settings.arguments; // room id
    List<Message> msgs = chatMsgs(room.id);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        elevation: 7,
        title: Text(room.title),
        
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.network(
            roomImgUrl(room),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: msgs == null || msgs.length == 0
          ? Center(
              child: Text('No messages, type a message !'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller:
                          new ScrollController(initialScrollOffset: 0.0),
                      itemCount: msgs.length,
                      itemBuilder: (_, idx) {
                        return MessageItem(msgs[idx]);
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20.0)),
                  margin: EdgeInsets.only(left: 7.0, right: 7.0, bottom: 5.0),
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
