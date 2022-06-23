import 'package:energia_app/widgets/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'mainHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<SliderDrawerState> _key = new GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SliderDrawer(
          // sliderShadow: SliderShadow(
          //   shadowSpreadRadius: 20,
          // ),
          splashColor: Colors.white,
          appBar: SliderAppBar(
            appBarColor: const Color(0xFF03144c),
            appBarPadding: const EdgeInsets.only(top: 30, right: 40),
            // appBarHeight: 80,
            title: Center(
              child: Text('Energia Powered',
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            drawerIconColor: Colors.white,
            // trailing: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            // ),
          ),
          key: _key,

          // sliderMenuOpenOffset: 250,

          slider: MenuWidget(),
          child: MainHome()),
    );
  }
}
