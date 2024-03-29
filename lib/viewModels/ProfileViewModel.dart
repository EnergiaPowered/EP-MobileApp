import 'package:energia_app/models/articleModel.dart';
import 'package:energia_app/models/eventsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';

class ProfileViewModel {
  var baseUrl = 'https://energia21.herokuapp.com/api';

  Future<List<EventModel>> getEvents() async {
    var response = await http.get(Uri.parse('$baseUrl/events'));

    List<EventModel> eventList = [];

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = convert.json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            eventList.add(EventModel.fromJson(map));
          }
        }
      }
      eventList.forEach((element) {
        debugPrint(element.image);
      });

      return eventList;
    } else {
      throw Exception('error');
    }
  }

  Future<List<ArticleModel>> getArticles() async {
    var response = await http.get(Uri.parse('$baseUrl/blogs'));

    List<ArticleModel> blogs = [];
    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = convert.json.decode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            blogs.add(ArticleModel.fromJson(map));
          }
        }
      }
      return blogs;
    } else {
      throw Exception('error');
    }
  }

  void goBack(BuildContext context) {
    Navigator.of(context).pushNamed('/home');
  }
}
