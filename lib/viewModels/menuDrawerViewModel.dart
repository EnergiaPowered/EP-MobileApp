import 'package:energia_app/screens/inbox_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuDrawerViewModel {
  onClickItem(String name, BuildContext context) {
    switch (name) {
      case "Profile":
        Navigator.of(context).pushNamed('/profile');
        break;
      case "Notifications":
        Navigator.of(context).pushNamed('/notifications');
        break;
      case "Chat":
        Navigator.of(context).pushNamed(InBoxMessages.routeName);
        break;
      case "Pinned Items":
        Navigator.of(context).pushNamed('/pinnedItems');
        break;
      case "About Us":
        Navigator.of(context).pushNamed('/aboutUs');
        break;
      case "Projects":
        Navigator.of(context).pushNamed('/projects');
        break;
      case "LogOut":
        // AlertDialog()
        break;
    }
  }
}
