import 'package:energia_app/models/articleModel.dart';
import 'package:energia_app/models/eventsModel.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel{
  Future<List<EventModel>> getEvents() async{

    List<EventModel> eventList = new List<EventModel>();

    EventModel eventModel = EventModel("id","Flutter Div","12-9-2021",'Soon',"eventDes","Ebda3","eventOrg","https://homepages.cae.wisc.edu/~ece533/images/airplane.png");

    eventList.add(eventModel);
    eventList.add(eventModel);
    eventList.add(eventModel);
    eventList.add(eventModel);
    return eventList.toList();
  }

  Future<List<ArticleModel>> getArticles()async{

    List<ArticleModel> articleList= new List<ArticleModel>();
    ArticleModel articleModel = ArticleModel('id','why flutter is best option between corss-platform languages',
    'why flutter is best option between corss-platform languages why flutter is best option between corss-platform languages'
        'why flutter is best option between corss-platform languages'
        'why flutter is best option between corss-platform languages'
        'vwhy flutter is best option between corss-platform languages',
        'Mobile embedded development',
        "https://www.letsnurture.com/wp-content/uploads/2019/06/flutter-banner.jpg");


    articleList.add(articleModel);
    articleList.add(articleModel);
    articleList.add(articleModel);
    articleList.add(articleModel);
    articleList.add(articleModel);

    return articleList.toList();
  }


  void goBack(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }



}