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


  void goBack(BuildContext context){
    Navigator.of(context).pushNamed('/home');
  }



}