class EventModel {
  final String id;

  final String image;
  final String name;
  final String startDate;
  final String endDate;
  final String status;
  final String eventDescription;
  final String eventLocation;
  final String eventOrganizer;
  final String v;

  EventModel(
      {this.id,
      this.image,
      this.name,
      this.startDate,
      this.endDate,
      this.status,
      this.eventDescription,
      this.eventLocation,
      this.eventOrganizer,
      this.v});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      name: json['name'],
      image: json['eventImageID'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      eventDescription: json['eventMobileDescription'],
      eventLocation: json['eventLocation'],
      eventOrganizer: json['eventOrganizer'],
      v: json['__v'].toString(),
    );
  }
}
