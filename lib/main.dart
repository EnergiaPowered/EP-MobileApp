import 'package:energia_app/widgets/localdrawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import './screens/edit_profile.dart';
import './screens/expandedarticles.dart';
import './screens/inbox_screen.dart';
import './screens/article_details_screen.dart';
import './screens/event_deta_detials.dart';
import './screens/aboutUs.dart';
import './screens/pinnedItems.dart';
import './screens/profile.dart';
import './screens/projects.dart';
import 'services/App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primaryColor: const Color(0xFF03144c),
            textSelectionColor: const Color(0xFF03144c),
            appBarTheme: AppBarTheme(
                textTheme: TextTheme(
                    title: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
            )))),
        debugShowCheckedModeBanner: false,
        home: App(),
        routes: {
          ArticleDetailsScreen.routPage: (context) => ArticleDetailsScreen(),
          LocalDrawer.routPage: (context) => LocalDrawer(),
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
