import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/widgets/message_item.dart';
import 'package:flutter/material.dart';

class MessaagesListView extends StatefulWidget {
  @override
  _MessaagesListViewState createState() => _MessaagesListViewState();
}

class _MessaagesListViewState extends State<MessaagesListView> {
  final chatRef = FirebaseFirestore.instance
      .collection('chats')
      .orderBy('date', descending: true)
      .limitToLast(50)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: StreamBuilder(
        stream: chatRef,
        builder: (ctx, snapshot) {
          if (snapshot == null) {
            return Center(
              child: Text('Empty chat'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(snapshot.data.toString());
          final msgs = snapshot.data.documents;
          return msgs.length == 0
              ? Center(
                  child: Text('No Messages!, type a message :) '),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: msgs.length,
                  itemBuilder: (_, idx) {
                    return MessageItem(
                      text: msgs[idx]['text'],
                      uid: msgs[idx]['uid'],
                      timestamp: msgs[idx]['date'],
                      type: msgs[idx]['type'],
                      key: ValueKey(msgs[idx]['date']),
                    );
                  });
        },
      ),
    );
  }
}
