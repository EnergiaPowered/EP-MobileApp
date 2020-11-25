import 'package:energia_app/screens/auth_Screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../viewModels/menuDrawerViewModel.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static const routPage = '/menuWidget';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF03144c),
      padding: const EdgeInsets.only(top: 30, left: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Alrashidi',
            style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'BalsamiqSans'),
          ),
          Text(
            'Bio',
            style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontWeight: FontWeight.normal,
                fontSize: 18,
                fontFamily: 'BalsamiqSans'),
          ),
          SizedBox(
            height: 20,
          ),
          sliderItem('Profile', Icons.person_pin, context),
          sliderItem("Chat", Icons.message, context),
          sliderItem("Pinned Items", Icons.pin_drop, context),
          sliderItem("About Us", Icons.book, context),
          sliderItem('Projects', Icons.assignment, context),
          Expanded(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 18,
                ),
                GestureDetector(
                  onTap: () {
                    _firebaseAuth.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(""),
                      ),
                    );
                  },
                  child: Text(
                    "LogOut",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, BuildContext context) =>
      ListTile(
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.white),
          ),
          leading: Icon(
            icons,
            color: Colors.white,
            size: 28,
          ),
          onTap: () {
            MenuDrawerViewModel drawerViewModel = new MenuDrawerViewModel();
            drawerViewModel.onClickItem(title, context);
          });
}
