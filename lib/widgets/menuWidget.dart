import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/screens/auth_Screens/loginScreen.dart';
import 'package:energia_app/screens/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../viewModels/menuDrawerViewModel.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  static const routPage = '/menuWidget';

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var current_uid = FirebaseAuth.instance.currentUser.email.substring(2, 13);
  String first_name = "";
  String last_name = "";
  var image_url = "NULL";
  var bio = "bio";
  @override
  void initState() {
    super.initState();
    firestore
        .collection('users')
        .doc(current_uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          first_name = documentSnapshot.data()['first_name'];
          last_name = documentSnapshot.data()['last_name'];
          image_url = documentSnapshot.data()['image_url'];
          bio = documentSnapshot.data()['bio'];
        });
      } else {}
    });
  }

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: (image_url == "NULL" || image_url == null)
                    ? Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                        height: 130.0,
                        width: 130.0,
                      )
                    : Image.network(
                        image_url,
                        fit: BoxFit.cover,
                        height: 130.0,
                        width: 130.0,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Text(
              '$first_name $last_name',
              style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'BalsamiqSans'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            child: Text(
              bio,
              style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  fontFamily: 'BalsamiqSans'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.white),
            ),
            leading: Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 28,
            ),
            onTap: () async {
              var value = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditProfile(),
              ));
              firestore
                  .collection('users')
                  .doc(current_uid)
                  .get()
                  .then((DocumentSnapshot documentSnapshot) {
                if (documentSnapshot.exists) {
                  setState(() {
                    first_name = documentSnapshot.data()['first_name'];
                    last_name = documentSnapshot.data()['last_name'];
                    image_url = documentSnapshot.data()['image_url'];
                    bio = documentSnapshot.data()['bio'];
                  });
                } else {}
              });
            },
          ),
          //sliderItem('Profile', Icons.person_pin, context),
          sliderItem("Chat", Icons.message, context),
          // sliderItem("Pinned Items", Icons.pin_drop, context),
          sliderItem("About Us", Icons.book, context),
          // sliderItem('Projects', Icons.assignment, context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
