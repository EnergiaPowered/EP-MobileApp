class EventModel {
  final String id;
  final String name;
  final String date;
  final String status;
  final String eventDescription;
  final String eventLocation;
  final String eventOrganizer;
  final String v;

  EventModel(
      {this.id,
      this.name,
      this.date,
      this.status,
      this.eventDescription,
      this.eventLocation,
      this.eventOrganizer,
      this.v});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      name: json['name'],
      date: json['date'],
      status: json['status'],
      eventDescription: json['eventDescription'],
      eventLocation: json['eventLocation'],
      eventOrganizer: json['eventOrganizer'],
      v: json['__v'].toString(),
    );
  }
}
