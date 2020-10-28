import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<MessagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('messages'),
    );
  }
}
