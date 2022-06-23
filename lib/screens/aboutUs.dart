import 'package:energia_app/models/aboutus.dart';
import 'package:energia_app/widgets/aboutusbody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    About aboutObj = About();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:  const Color(0xFF03144C),
          title: Text(
            "Energia Powered",
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: FutureBuilder(
          future: aboutObj.loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ChangeNotifierProvider.value(
                value: aboutObj,
                child: AboutUsBody(),
              );
            }
            return const Center(
              child: const CircularProgressIndicator(),
            );
          },
        ));
  }
}
