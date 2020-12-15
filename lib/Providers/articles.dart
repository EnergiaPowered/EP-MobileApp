import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/Providers/article_provider.dart';
import 'package:energia_app/Providers/comment_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class Articles with ChangeNotifier {
  /*
  Comments Demo List
   */
  List<Comment> _comments = [];

/*
  Articles Demo List
*/
  List<Article> _upCommingArticles = [
    Article(
      id: "1",
      commentsNumber: 2,
      likesNumber: 3,
      isLiked: true,
      title: "Mobile Development",
      isPinned: false,
      department: "Mobile",
    ),
    Article(
      id: "2",
      commentsNumber: 2,
      likesNumber: 3,
      isLiked: true,
      title: "Mobile Development",
      isPinned: false,
      department: "Mobile",
    ),
    Article(
      id: "3",
      commentsNumber: 2,
      likesNumber: 3,
      isLiked: true,
      title: "Mobile Development",
      isPinned: false,
      department: "Mobile",
    ),
  ];

  Future<void> addComment(String commenttext, String currentuserPhone,
      String myarticleId, String img, String name) async {
    String photoUrl = img;
    final url =
        'https://energiaapp-3eaa3.firebaseio.com/ArticlesComments/$myarticleId.json';
    try {
      Comment comment = Comment(
          articleId: myarticleId, comment: commenttext, userPhoto: photoUrl);
      final respose = await http.post(url,
          body: json.encode({
            'comment': comment.comment,
            'articleId': comment.articleId,
            'userPhoto': comment.userPhoto,
            'name': name
          }));

      final newComment = Comment(
          userPhoto: photoUrl,
          articleId: myarticleId,
          comment: comment.comment);
      _comments.insert(0, newComment);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<List<Comment>> fetchAndSetComments(String articleId) async {
    try {
      final url =
          'https://energiaapp-3eaa3.firebaseio.com/ArticlesComments/1.json';
      final response = await http.get(url);
      final List<Comment> loadeComments = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return null;
      }
      extractedData.forEach((articleId, comment) {
        loadeComments.add(
          Comment(
            articleId: articleId,
            comment: comment['comment'],
            userPhoto: comment['userPhoto'],
            name: comment['name'],
          ),
        );
      });
      _comments = loadeComments.reversed.toList();
      notifyListeners();
      return comments;
    } catch (e) {
      throw e;
    }
  }

  List<Article> _previousArticles = [];

/*Find The Article From Id */
  Article findFromUpCommingArticlesById(String id) {
    return _upCommingArticles.firstWhere((element) => element.id == id);
  }

/*Get Upcomming Articles */
  List<Article> get upCommingArticles {
    return _upCommingArticles;
  }

/*Get previous Articles */
  List<Article> get previousArticles {
    return _previousArticles;
  }

/*Get Upcomming Articles From Database*/
  Future<void> fechUpCommingArticles() async {
    notifyListeners();
  }

/*Get Previous Articles From Database*/
  Future<void> fechUpPreviousArticles() async {
    notifyListeners();
  }

  /*Get Upcomming Articles */
  List<Comment> get comments {
    notifyListeners();
    return _comments;
  }

  /*Get image of the user */
  Future<String> getimageByUserPhone(String phone) async {
    final String s = await FirebaseStorage.instance
        .ref()
        .child('/profiles')
        .child(phone + '.jpg')
        .getDownloadURL()
        .then((value) => value.toString());

    notifyListeners();
    return s;
  }
}
