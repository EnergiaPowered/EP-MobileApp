import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwitchLanguage extends StatefulWidget {
  bool value;
  SwitchLanguage(this.value);
  @override
  _SwitchLanguageState createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Switch to Arabic',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text('change language of the App to Arabic'),
              ],
            ),
          ),
          Switch(
            value: widget.value,
            onChanged: (val) {
              setState(() {
                widget.value = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
