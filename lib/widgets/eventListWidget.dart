import 'package:energia_app/models/eventsModel.dart';
import 'package:energia_app/screens/event_deta_detials.dart';
import 'package:energia_app/viewModels/ProfileViewModel.dart';
import 'package:flutter/material.dart';

class EventListWidget extends StatefulWidget {
  final Size size;
  EventListWidget(this.size);

  @override
  _EventListWidgetState createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  List<EventModel> eventList = new List<EventModel>();
  ProfileViewModel _profileViewModel = new ProfileViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Container(
        width: widget.size.width,
        margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: FutureBuilder<List<EventModel>>(
                  future: _profileViewModel.getEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      eventList = snapshot.data;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
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
                                                eventList[index].date,
                                                eventList[index].eventOrganizer,
                                                eventList[index].eventLocation,
                                                eventList[index]
                                                    .eventDescription)));
                              },
                              child: Container(
                                  width: 260,
                                  height: 280,
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
                                                  fontSize: 20,
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
                                                          "${eventList[index].date}",
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
                                        child: Image.asset(
                                          'assets/images/image.jpg',
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 180,
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
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
