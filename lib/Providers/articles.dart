import 'package:energia_app/Providers/article_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class Articles with ChangeNotifier {
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
  List<Article> _previousArticles = [];

  Article findFromUpCommingArticlesById(String id) {
    return _upCommingArticles.firstWhere((element) => element.id == id);
  }

  List<Article> get upCommingArticles {
    return _upCommingArticles;
  }

  List<Article> get previousArticles {
    return _previousArticles;
  }

  Future<void> fechUpCommingArticles() async {
    notifyListeners();
  }

  Future<void> fechUpPreviousArticles() async {
    notifyListeners();
  }
}
