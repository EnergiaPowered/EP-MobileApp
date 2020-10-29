
class EventModel{
final String id;
final String name;
final String date;
final String status;
final String eventDescription;
final String eventLocation;
final String eventOrganizer;
final String imageUrl;

EventModel(this.id, this.name, this.date, this.status, this.eventDescription,
      this.eventLocation, this.eventOrganizer,this.imageUrl);
//
//factory EventModel.fromJson(Map<String,dynamic> json){
//return EventModel(
//  id: json['id'],
//  name: json['name'],//
//  date: json['date'],//
//  status: json['status'],//
//  eventDescription: json['eventDescription'],//
//  eventLocation: json['eventLocation'],//
//  eventOrganizer: json['eventOrganizer'],
//  imageUrl: json['imageUrl'],//
//);
//}
}
