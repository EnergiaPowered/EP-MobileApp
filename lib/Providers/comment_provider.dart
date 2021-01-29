import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class Comment with ChangeNotifier {
  final String comment;
  final String articleId;
  final String userPhoto;
  final String name;
  

  Comment({
    this.comment,
    this.articleId,
    this.userPhoto,
    this.name
  });

  

  Future<void> writeComment() async {}
  
}
