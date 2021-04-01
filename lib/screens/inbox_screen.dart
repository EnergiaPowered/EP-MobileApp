import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/screens/show_photo_in_one_screan.dart';
import 'package:energia_app/widgets/messages_listview.dart';
import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/chat_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
class InBoxMessages extends StatefulWidget {
  static const String routeName = '/inbox-screen';

  @override
  _InBoxMessagesState createState() => _InBoxMessagesState();
}

class _InBoxMessagesState extends State<InBoxMessages> {
  final List<Message> messages = new List();

 /// final currUser = FirebaseAuth.instance.currentUser.email.substring(2,13);
 /// print("currUser  ${currUser.substring(2,13)}");

  var appcolor = Color(0xFF03144c);

  ///  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  var channelId = '123';
  var current_uid=FirebaseAuth.instance.currentUser.email.substring(2,13);
  var current_email;

  var admin_uid;
  var admin_email;



  TextEditingController MessageControler = TextEditingController();
  ScrollController scrollController = ScrollController();

  String playerId = "";
  @override
  Future<void> initState()  {
    current_uid=FirebaseAuth.instance.currentUser.email.substring(2,13);
    firestore
        .collection('admin')
        .doc("admin")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          admin_uid = documentSnapshot.data()['uid'];
          admin_email=documentSnapshot.data()['Email'];
        });
      } else {

      }
    }).whenComplete(() {
      firestore
          .collection('users')
          .doc(current_uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          setState(() {
            /// = documentSnapshot.id;
            current_email=documentSnapshot.data()['Email'];
          });
        } else {

        }
      });
      firestore
          .collection('users')
          .doc(current_uid)
          .collection('ChatChannel')
          .doc(admin_uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          setState(() {
            channelId = documentSnapshot.get('channelId');
          });
        } else {
          var newChatChannel = firestore.collection("users").doc();

          firestore
              .collection("users")
              .doc(current_uid)
              .collection("ChatChannel")
              .doc(admin_uid)
              .set({
            'channelId': newChatChannel.id,
          });
          firestore
              .collection("admin")
              .doc("admin")
              .collection("ChatChannel")
              .doc(current_uid)
              .set({"channelId": newChatChannel.id});

          setState(() {
            channelId = newChatChannel.id;
          });
        }
      });
    });


  }




  @override
  Widget build(BuildContext context) {


    return current_uid != null? Scaffold(
      appBar: AppBar(
        title: Text('Admins'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/pp.png'),
        ),
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('ChatChannel')
            .doc(channelId)
            .collection('messages')
            .orderBy('data', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Column(
            children: [
              Expanded(
                child: new ListView(
                  reverse: true,
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    //

                    return document.data()['type'] == 'text'
                        ? DrowNewMessage(
                      document.data()['message'],
                      document.data()['sederEmail'],
                      document.data()['data'],
                    )
                        : document.data()['type'] == 'image'
                        ? DrowNewImage(
                      document.data()['message'],
                      document.data()['sederEmail'],
                      document.data()['data'],
                    )
                        : Drowsticars(
                      document.data()['message'],
                      document.data()['sederEmail'],
                      document.data()['data'],
                    );
                  }).toList(),
                ),
              ),
              ChatInputWidget(channelId,current_email,current_uid,admin_uid)
            ],
          );
        },
      ),
    ):Scaffold(
      appBar: AppBar(
        title: Text('Admins'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/pp.png'),
        ),
      ),
      body: Center(
        child: Text('Log in first'),
      ),
    );
  }
  Widget DrowNewMessage(message, senderEmail, data){
    return Bubble(
      margin: BubbleEdges.only(
          top: 10,
          bottom: 10,
          left: senderEmail == current_email ? 0 : 5,
          right: senderEmail == current_email ? 5 : 0),
      alignment: senderEmail == current_email ? Alignment.topRight : Alignment.topLeft,
      nipWidth: 8,
      nipHeight: 24,
      nip: senderEmail == current_email ? BubbleNip.rightTop : BubbleNip.leftTop,
      color: senderEmail == current_email ? Colors.grey.shade300 : Color(0xFF03144c),
      child: Column(
          crossAxisAlignment: senderEmail == current_email
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
          children: [
            Text(
              message,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                color:senderEmail == current_email ? Colors.black : Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(7.0),
              child: Text(
                getdata(data),
                style: TextStyle(
                    fontSize: 12,
                    color: senderEmail == current_email ? Colors.black : Colors.white),
              ),
            ),
          ]),
    );
  }
  Widget DrowMessage(message, senderEmail, data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: senderEmail == current_email
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: senderEmail == current_email ? appcolor : Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      color: senderEmail == current_email
                          ? Colors.white
                          : appcolor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    getdata(data),
                    style: TextStyle(
                        color: senderEmail == current_email
                            ? Colors.white
                            : appcolor,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget DrowNewImage(message, senderEmail, data) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c) {
          return show_photo_in_one_screan(message);}));
      },
      child: Container(
        alignment:
        senderEmail == current_email ? Alignment.topRight : Alignment.topLeft,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight:
                senderEmail == current_email ? Radius.zero : Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft:
                senderEmail == current_email ?Radius.circular(10) : Radius.zero,
              ),
              child: Image.network(
                message,
                scale: 0.5,
                fit: BoxFit.cover,
                width: 220,
                height: 200,
                loadingBuilder: (_, widget, progress) {
                  if (progress == null) return widget;
                  return Center(
                    widthFactor: 2,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                getdata(data),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*Widget DrowImage(message, senderEmail, data) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c) {
          return show_photo_in_one_screan(message);}));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: senderEmail == current_email
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: senderEmail == current_email ? appcolor : Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(message),
                          fit: BoxFit.fill,
                        ),
                        //shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      getdata(data),
                      style: TextStyle(
                          color: senderEmail == current_email
                              ? Colors.white
                              : appcolor,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }*/

  String getdata(data) {
    DateTime todayDate = DateTime.parse(data);
    return DateFormat("yyyy/MM/dd                hh:mm").format(todayDate);
  }

  DateTime returnData(data){
    // String string = dateFormat.format(DateTime.now());
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    return    dateFormat.parse(data);
  }

  Widget Drowsticars(message, senderEmail, data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: senderEmail == current_email
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: senderEmail == current_email ? appcolor : Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/gmap.png"),
                        fit: BoxFit.fill,
                      ),
                      //shape: BoxShape.circle,
                    ),
                  ),
                  RaisedButton.icon(
                    onPressed: () {

                    },
                    icon: Icon(Icons.location_on,color: appcolor,size: 40,),
                    label: Text('Show location'),
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    getdata(data),
                    style: TextStyle(
                        color: senderEmail == current_email
                            ? Colors.white
                            : appcolor,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
