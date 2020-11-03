import 'package:energia_app/widgets/menuWidget.dart';
import 'package:flutter/material.dart';

class LocalDrawer extends StatelessWidget {
  static const routPage = '/menuWidget';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MenuWidget(),
    );
  }
}