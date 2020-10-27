import 'package:flutter/material.dart';

class PinnedItems extends StatefulWidget {
  @override
  _PinnedItemsState createState() => _PinnedItemsState();
}

class _PinnedItemsState extends State<PinnedItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pinned Items'),
      ),
    );
  }
}
