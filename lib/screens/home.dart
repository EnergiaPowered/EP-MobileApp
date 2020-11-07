import 'package:energia_app/widgets/menuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import 'mainHome.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<SliderMenuContainerState> _key =
      new GlobalKey<SliderMenuContainerState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SliderMenuContainer(
          shadowSpreadRadius: 20,
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
          title: Text('Energia Power',
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          sliderMenu: MenuWidget(),
          sliderMain: MainHome()),
    );
  }
}
