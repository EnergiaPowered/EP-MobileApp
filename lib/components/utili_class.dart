

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
var appcolor = Color(0xFF12c0c7);

class HelpFun{

  void startLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(
                  strokeWidth: 5,
                  backgroundColor: appcolor,
                ),
                new Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }

  void closeLoading(context) {
    Navigator.pop(context);
  }

  void my_Toast(String mess,context) {
    Toast.show(mess, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  }

}