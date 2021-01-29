import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class Article with ChangeNotifier {
  final String id;
  final String title;
  final String body;
  final String department;
  int likesNumber;
  int commentsNumber;
  bool isPinned;
  bool isLiked;
  List<String> _comments;

  final String imageUrl;

  Article({
    this.id,
    this.title,
    this.body,
    this.department,
    this.imageUrl,
    this.likesNumber,
    this.commentsNumber,
    this.isPinned = false,
    this.isLiked = false,
  });

  List<String> get comments {
    return _comments;
  }

  Future<void> writeComment() async {}
  void toggleLike()  {
   
    isLiked = !isLiked;
    print(isLiked);
    print(id);
    notifyListeners();
    //likesNumber += 1;
  }
}
