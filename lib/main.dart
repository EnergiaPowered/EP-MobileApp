
import 'dart:ui';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './screens/article_details_screen.dart';
import './screens/event_deta_detials.dart';
import './widgets/eventsWidget.dart';
import './widgets/homeWidget.dart';
import './widgets/mainTest.dart';
import './widgets/menuWidget.dart';
import 'package:flutter/material.dart';

import './widgets/articleWidget.dart';

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
            title: TextStyle(color: Colors.white , fontWeight: FontWeight.bold) ),
             color:  Color(0xFF21BFBD),
             iconTheme: IconThemeData(
               color: Colors.white
             )
           ), 
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            iconTheme: IconThemeData(color: Colors.white),
            
          );
  ThemeData darkTheme = ThemeData(
//    primarySwatch: Colors.grey,
//    buttonColor: Colors.grey,
//     primaryColor: Color.fromRGBO(156, 216, 226, 1),
//    brightness: Brightness.dark,
//     accentIconTheme: IconThemeData(color: Colors.black),
//     dividerColor: Colors.black12,
    backgroundColor: const Color(0xFF03144c),
    accentColor: Colors.white,

  );
  ThemeData lightTheme  =  ThemeData(
//    primarySwatch: Colors.grey,
//    primaryColor: Color.fromRGBO(156, 216, 226, 1),
//    buttonColor: Color.fromRGBO(156, 216, 226, 1),
//    brightness: Brightness.light,
//    textSelectionColor: Colors.white,
//    accentIconTheme: IconThemeData(color: Colors.white),
//    dividerColor: Colors.white54,
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
        body: MainHome(),
//        body: SliderMenuContainer(
//            appBarColor: Colors.white,
//            key: _key,
//            trailing:Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: [
//
//                Icon(Icons.search,color: Theme.of(context).backgroundColor,),
//                SizedBox(width: 8),
//                Icon(Icons.notifications,color: Theme.of(context).backgroundColor,),
//                SizedBox(width: 8),
//
//
//          ],
//        ),
//            appBarPadding: const EdgeInsets.only(top: 20),
//            sliderMenuOpenOffset: 250,
//            appBarHeight: 60,
//            title: Text(
//              'Energia Power',
//              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//            ),
//
//            sliderMenu: MenuWidget(
//              onItemClick: (title) {
//                _key.currentState.closeDrawer();
//              }
//            ),
//            sliderMain: MainHome()),
      ),
      routes: {
           ArticleDetailsScreen.routPage:(ctx)=> ArticleDetailsScreen(),
           EventDetailsScreen.routPage:(ctx)=> EventDetailsScreen(),

      }
    );
  }
}

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    EventWidget(),
    ArticleWidget(),
    HomeWidget(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor ,
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 35 ,color: Theme.of(context).backgroundColor,),
            Icon(Icons.event, size: 35,color: Theme.of(context).backgroundColor,),
            Icon(Icons.library_books, size: 35,color: Theme.of(context).backgroundColor,),
            Icon(Icons.chat, size: 35,color: Theme.of(context).backgroundColor,),
          ],
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).backgroundColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                  color: Theme.of(context).backgroundColor,
                  spreadRadius: 5,
                  blurRadius: 2
              )]
          ),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Icon(Icons.menu,size: 30,color: Theme.of(context).backgroundColor,)),
                  Padding(
                    padding: const EdgeInsets.only(left:13.0, top: 5),
                    child: Text("Energia Power",style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.search,color: Theme.of(context).backgroundColor,),
                      SizedBox(width: 8),
                      Icon(Icons.notifications,color: Theme.of(context).backgroundColor,),
                      SizedBox(width: 8),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      body: _children[_currentIndex]
      
    );
  }
}

