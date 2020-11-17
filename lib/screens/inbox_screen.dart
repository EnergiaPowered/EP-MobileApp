import 'package:energia_app/widgets/messages_listview.dart';
import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/chat_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InBoxMessages extends StatefulWidget {
  static const String routeName = '/inbox-screen';

  @override
  _InBoxMessagesState createState() => _InBoxMessagesState();
}

class _InBoxMessagesState extends State<InBoxMessages> {
  final List<Message> messages = new List();

  @override
  Widget build(BuildContext context) {
    final currUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Admins'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/pp.png'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: currUser == null
                ? MessaagesListView()
                : Center(
                    child: Text('Log in first'),
                  ),
          ),
          ChatInputWidget(),
        ],
      ),
    );
  }
}
