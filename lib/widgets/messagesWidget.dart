// import 'package:energia_app/widgets/inbox_screen.dart';
// import 'package:flutter/material.dart';

// class MessagesWidget extends StatelessWidget {
//   // final rooms = [
//   //   ChatRoom(
//   //     id: '1',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '2',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '3',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '4',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '5',
//   //     title:
//   //         'khaled alil lskjfalkdsjf;ajflkdsja;ldsjf;lakds;ljfalksdjflkjsalkdfjlsdkjflkajsdfl',
//   //     lastMsg:
//   //         'what\'s up ? bro klsdfjsdlka;fjasdlkfjsdakl;fjalskdfjsasdlka;fjklsdafjklsdsdfsdfhskdjafhsdkj !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '6',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '7',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '8',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '9',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   //   ChatRoom(
//   //     id: '10',
//   //     title: 'khaled ali',
//   //     lastMsg: 'what\'s up ? bro !',
//   //     lastMsgAutherId: 'me',
//   //     date: DateTime.now().millisecond,
//   //     member1Id: 'me',
//   //     member2Id: 'you',
//   //     member1ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //     member2ImgUrl:
//   //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//   //   ),
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Image.network(),
//           title: Text('Contact Admins'),
//         ),
//         body: InBoxMessages());
//     //  Container(
//     //     color: Colors.grey.shade200,
//     //     child: ListView.builder(
//     //         itemCount: rooms.length,
//     //         padding: EdgeInsets.all(5.0),
//     //         itemBuilder: (_, idx) {
//     //           return ChatRoomItem(rooms[idx]);
//     //         }));
//   }
// }
