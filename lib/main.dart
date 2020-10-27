import 'dart:ui';
import 'package:energia_app/screens/mainHome.dart';
import 'package:energia_app/screens/profile.dart';
import 'package:energia_app/widgets/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: const Color(0xFF03144c),
    textSelectionColor: const Color(0xFF03144c),

  );
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SliderMenuContainer(
            appBarPadding: const EdgeInsets.only(top: 40),
            sliderMenuOpenOffset: 210,
            appBarHeight: 60,
            appBarColor: const Color(0xFF03144c),
            drawerIconColor: Colors.white,
            key: _key,
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.white,),
                SizedBox(width: 8),
                Icon(Icons.notifications, color: Colors.white,),
                SizedBox(width: 8),
              ],
            ),
            title: Text(
              'Energia Power',
              style: TextStyle(fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            sliderMenu: MenuWidget(
            ),
            sliderMain: MainHome()),
      ),
      routes: {
        '/profile':(context)=> new ProfileWidget(),
      },
    );
  }
}


