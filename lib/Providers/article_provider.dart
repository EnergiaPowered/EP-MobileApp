
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

  final String imageUrl;

  Article(this.id, this.title, this.body, this.department, this.imageUrl,
      this.likesNumber, this.commentsNumber, this.isPinned);

  Future<void> writeComment () async{

  }
  Future<void> toggleLike () async{
    
  }
}
