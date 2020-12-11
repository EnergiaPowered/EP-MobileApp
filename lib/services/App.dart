import 'package:energia_app/screens/auth_Screens/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _user;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        setState(() {
          _user = user;
        });
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user != null ? Home() : LoginScreen("");
  }
}
