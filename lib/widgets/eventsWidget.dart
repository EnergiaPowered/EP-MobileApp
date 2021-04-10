import 'package:energia_app/models/eventsModel.dart';
import 'package:energia_app/viewModels/ProfileViewModel.dart';
import 'package:flutter/material.dart';
import '../screens/event_deta_detials.dart';

class EventsWidget extends StatefulWidget {
  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  List<EventModel> eventList = new List<EventModel>();
  ProfileViewModel _profileViewModel = new ProfileViewModel();
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    Widget gradientContainer = Container(
        margin: EdgeInsets.fromLTRB(mediaSize.width / 40, 0, 0, 0),
        child: Container(
          width: 80,
          height: 3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.3, 1],
                colors: [Theme.of(context).primaryColor, Colors.white]),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ));
    Widget whiteContainerup = Container(
        width: mediaSize.width / 1.4,
        //color: Colors.red,
        child: Stack(
          //alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  mediaSize.width / 10,
                  mediaSize.height / 50,
                  mediaSize.width / 20,
                  mediaSize.height / 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: mediaSize.height / 30,
              left: mediaSize.width / 6.5,
              child: Image.asset(
                'assets/images/pp.png',
                scale: 15,
              ),
            ),
            Positioned(
              top: mediaSize.height / 10.1,
              left: mediaSize.width / 10,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(mediaSize.width / 40,
                              mediaSize.height / 80, 0, 0),
                          child: Text(
                            "Contents",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
                                color: Theme.of(context).textSelectionColor),
                          )),
                      gradientContainer,
                      /*
                      Row Of bottom informations
                    */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: mediaSize.width / 25),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              ],
                            ),
                          ),
                          /* To write towards bolits write code here */
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: mediaSize.width / 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/articlepaper.png',
                  scale: 9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));

    Widget whiteContainerpre = Container(
        width: mediaSize.width / 1.4,
        //color: Colors.red,
        child: Stack(
          //alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(
                  mediaSize.width / 10,
                  mediaSize.height / 50,
                  mediaSize.width / 100,
                  mediaSize.height / 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: mediaSize.height / 20,
              left: mediaSize.width / 6.5,
              child: Image.asset(
                'assets/images/pp.png',
                scale: 15,
              ),
            ),
            Positioned(
              top: mediaSize.height / 10.1,
              left: mediaSize.width / 10,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(mediaSize.width / 40,
                              mediaSize.height / 30, 0, 0),
                          child: Text(
                            "Contents",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15.0,
                                color: Theme.of(context).textSelectionColor),
                          )),
                      gradientContainer,
                      /*
                      Row Of bottom informations
                    */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: mediaSize.width / 25),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )
                              ],
                            ),
                          ),
                          /* To write towards bolits write code here */
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: mediaSize.width / 15,
              top: mediaSize.height / 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/images/articlepaper.png',
                  scale: 9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
    List<Widget> localListupcomming = [
      whiteContainerup,
      whiteContainerup,
      whiteContainerup,
      whiteContainerup,
    ];
    List<Widget> localListprev = [
      whiteContainerpre,
      whiteContainerpre,
      whiteContainerpre,
      whiteContainerpre,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(
                  mediaSize.width / 50, mediaSize.height / 60, 0, 0),
              child: Text(
                "Upcoming Events",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                    color: Theme.of(context).textSelectionColor),
              )),
          gradientContainer,
          /*
            upcomming Events part
             */
          InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(EventDetailsScreen.routPage),
              child: Container(
                height: 300,
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
                                                  eventList[index]
                                                      .eventOrganizer,
                                                  eventList[index]
                                                      .eventLocation,
                                                  eventList[index]
                                                      .eventDescription)));
                                },
                                child: Container(
                                    width: 260,
                                    height: 280,
                                    margin: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 5.0, 5.0),
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
                                                          MainAxisAlignment
                                                              .start,
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
                                                                  FontWeight
                                                                      .bold,
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
              )),
/*----------------------------------------------------------------------------------------------------------------------------------------------- */

          Divider(),

          /*
            Previous Events part
          */
          Container(
              margin: EdgeInsets.fromLTRB(mediaSize.width / 50, 0, 0, 0),
              child: Text(
                "Previous Events",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0,
                    color: Theme.of(context).textSelectionColor),
              )),
          gradientContainer,
          InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(EventDetailsScreen.routPage),
              child: Container(
                height: 300,
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
                                                  eventList[index]
                                                      .eventOrganizer,
                                                  eventList[index]
                                                      .eventLocation,
                                                  eventList[index]
                                                      .eventDescription)));
                                },
                                child: Container(
                                    width: 260,
                                    height: 280,
                                    margin: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 5.0, 5.0),
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
                                                          MainAxisAlignment
                                                              .start,
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
                                                                  FontWeight
                                                                      .bold,
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
              )),
        ],
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
