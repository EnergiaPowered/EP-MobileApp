import 'package:flutter/material.dart';
import 'dart:ui';
import './screens/edit_profile.dart';
import './screens/expandedarticles.dart';
import './screens/inbox_screen.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import './screens/article_details_screen.dart';
import './screens/event_deta_detials.dart';
import './widgets/menuWidget.dart';
import './screens/aboutUs.dart';
import './screens/mainHome.dart';
import './screens/pinnedItems.dart';
import './screens/profile.dart';
import './screens/projects.dart';
import './widgets/menuWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData fontTheme = ThemeData(
    textTheme: ThemeData.light().textTheme.copyWith(
        // ignore: deprecated_member_use
        title: TextStyle(color: Colors.white)),
    primaryColor: Color(0xFF21BFBD),
    appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: deprecated_member_use
            title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        color: Color(0xFF21BFBD),
        iconTheme: IconThemeData(color: Colors.white)),
    accentColor: Colors.deepOrange,
    fontFamily: 'Lato',
    iconTheme: IconThemeData(color: Colors.white),
  );
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: const Color(0xFF03144c),
          textSelectionColor: const Color(0xFF03144c),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SliderMenuContainer(
              drawerIconColor: Colors.white,
              appBarColor: const Color(0xFF03144c),
              key: _key,
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                ],
              ),
              appBarPadding: const EdgeInsets.only(top: 30),
              sliderMenuOpenOffset: 250,
              appBarHeight: 60,
              title: Text(
                'Energia Power',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontFamily: 'assets/fonts/Lato-Regular.ttf',
                    fontWeight: FontWeight.w700),
              ),
              sliderMenu: MenuWidget(),
              sliderMain: MainHome()),
        ),
        routes: {
          ArticleDetailsScreen.routPage: (context) => ArticleDetailsScreen(),
          ExpandedArticles.routPage: (context) => ExpandedArticles(),
          EventDetailsScreen.routPage: (ctx) => EventDetailsScreen(),
          '/profile': (context) => new Profile(),
          '/home': (context) => new MyApp(),
          '/pinnedItems': (context) => new PinnedItems(),
          '/aboutUs': (context) => new AboutUs(),
          '/projects': (context) => new Projects(),
          InBoxMessages.routeName: (_) => InBoxMessages(),
          EditProfile.routeName: (_) => EditProfile(),
        });
  }
}
