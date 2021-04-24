import 'package:energia_app/Providers/articles.dart';
import 'package:energia_app/Providers/comment_provider.dart';
import 'package:energia_app/screens/auth_Screens/loginScreen.dart';
import 'package:energia_app/services/notifications.dart';
import 'package:energia_app/widgets/localdrawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';
import './screens/edit_profile.dart';
import './screens/expandedarticles.dart';
import './screens/inbox_screen.dart';
import './screens/article_details_screen.dart';
import './screens/event_deta_detials.dart';
import './screens/aboutUs.dart';
import './screens/pinnedItems.dart';
import './screens/profile.dart';
import './screens/projects.dart';
import 'Providers/article_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String playerId = "ed905290-3c4a-4591-a781-893a9e42cd4d";
  Notifications notifications;
  ThemeData fontTheme = ThemeData(
    textTheme: ThemeData.light().textTheme.copyWith(
        // ignore: deprecated_member_use
        title: TextStyle(color: Colors.white)),
    primaryColor: Color(0xFF21BFBD),
    appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: deprecated_member_use
            title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        color: Color(0xFF21BFBD),
        iconTheme: IconThemeData(color: Colors.white)),
    accentColor: Colors.deepOrange,
    fontFamily: 'Lato',
    iconTheme: IconThemeData(color: Colors.white),
  );
  void initOneSignal() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.init("4aaffab3-0518-47aa-91bc-59e96cb99055", iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false
    });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

    var status = await OneSignal.shared.getPermissionSubscriptionState();
    playerId = status.subscriptionStatus.userId;
    setState(() {
      playerId = playerId;
    });
    print("playerId: $playerId");
  }

  Widget nextPage;
  String name = '';

  Future<String> shared() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getString('userName');
  }

  @override
  void initState() {
    // TODO: implement initState
    //
    shared().then((value) {
      setState(() {
        name = value;
      });
    });
    initOneSignal();
    notifications = new Notifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Article(),
        ),
        ChangeNotifierProvider.value(
          value: Articles(),
        ),
        ChangeNotifierProvider.value(
          value: Comment(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            primaryColor: const Color(0xFF03144c),
            textSelectionColor: const Color(0xFF03144c),
            appBarTheme: AppBarTheme(
                textTheme: TextTheme(
                    headline6: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
            )))),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(playerId), //App(),
        routes: {
          ArticleDetailsScreen.routPage: (context) => ArticleDetailsScreen(),
          LocalDrawer.routPage: (context) => LocalDrawer(),
          ExpandedArticles.routPage: (context) => ExpandedArticles(),
          EventDetailsScreen.routPage: (ctx) => EventDetailsScreen('department',
              'date', 'eventOrganizer', 'eventLocation', 'eventDescription'),
          '/profile': (context) => new Profile(),
          '/home': (context) => new MyApp(),
          '/pinnedItems': (context) => new PinnedItems(),
          '/aboutUs': (context) => new AboutUs(),
          '/projects': (context) => new Projects(),
          InBoxMessages.routeName: (_) => InBoxMessages(),
          EditProfile.routeName: (_) => EditProfile(),
        },
      ),
    );
  }
}
