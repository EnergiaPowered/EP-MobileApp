import 'dart:async';
import 'package:energia_app/components/fadeAnimation.dart';
import 'package:energia_app/services/App.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String? playerId;

  const SplashScreen({Key? key, @required this.playerId}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => App(
            playerId: widget.playerId!,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.width * 0.3,
                      ),
                      FadeAnimation(
                        2,
                        Image(
                          image: AssetImage('assets/images/logo.png'),
                          width: size.width * 0.6,
                          fit: BoxFit.contain,
                        ),
                      ),
                      FadeAnimation(
                          1,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                            child: Text(
                              "ENERGIA POWERED",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Expanded(
                  flex: 1,
                  child: FadeAnimation(
                    1,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Copyright © Energia Powered',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 17, color: Colors.white),
                        ),
                        Text(
                          'All Rights Reserved',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 17, color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
