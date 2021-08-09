import 'package:energia_app/models/eventsModel.dart';
import 'package:energia_app/screens/event_deta_detials.dart';
import 'package:energia_app/viewModels/ProfileViewModel.dart';
import 'package:flutter/material.dart';

class EventListWidget extends StatefulWidget {
  final Size size;
  final bool mainEvent;
  EventListWidget(this.size,this.mainEvent);

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  List<EventModel> eventList = [];
  ProfileViewModel _profileViewModel = new ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: widget.size.width,
        margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
        height: widget.mainEvent ? 300 : widget.size.height * 0.8,
        decoration: BoxDecoration(
          color:  widget.mainEvent ?Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: FutureBuilder<List<EventModel>>(
                    future: _profileViewModel.getEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        eventList = snapshot.data;
                        return ListView.builder(
                            scrollDirection:widget.mainEvent? Axis.horizontal:Axis.vertical,
                            itemCount: eventList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new EventDetailsScreen(
                                                  'department',
                                                  eventList[index].startDate,
                                                  eventList[index].eventOrganizer,
                                                  eventList[index].eventLocation,
                                                  eventList[index]
                                                      .eventDescription)));
                                },
                                child: Container(
                                    width: 260,
                                    height: 300,
                                    margin:
                                        EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              10.0, 30.0, 5.0, 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30.0)),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text("${eventList[index].name}",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        listitle(
                                                            "Start Date:${eventList[index].startDate}",
                                                            Icon(Icons
                                                                .date_range)),
                                                        listitle(
                                                            "End Date:${eventList[index].endDate}",
                                                            Icon(Icons
                                                                .date_range)),
                                                        listitle(
                                                            "${eventList[index].eventLocation}",
                                                            Icon(Icons
                                                                .location_on)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 16.0,
                                                                  top: 8.0),
                                                          child: Text(
                                                            "${eventList[index].status}",
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: eventList[index].image == ''
                                              ? Image.asset(
                                                  'assets/images/image.jpg',
                                                  fit: BoxFit.cover,
                                                  height: 05,
                                                  width: 180,
                                                )
                                              : Image.network(
                                                  "https://drive.google.com/uc?exort=view&id=${eventList[index].image}",
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent
                                                              loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;
                                                    return Image.asset(
                                                      'assets/images/image.jpg',
                                                      fit: BoxFit.cover,
                                                      width: 250,
                                                      height: 250,
                                                    );
                                                  },
                                                ),
                                        ),
                                      ],
                                    )),
                              );
                            });
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listitle(String text, Icon icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4.0),
      child: Row(
        children: <Widget>[
          icon,
          Container(width: 180, child: Text(text)),
        ],
      ),
    );
  }
}
