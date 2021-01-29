import 'package:onesignal_flutter/onesignal_flutter.dart';

class Notifications {
  void notificationFunctions() async {
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      // a notification has been received
      print('reciver ${notification.payload.body}');
    });
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print(result.notification.payload.body);
      // a notification has been opened
      print('opener ${result.notification.payload.body}');
    });
  }

  void postNotification(String title, String body, String playerId) async {
    await OneSignal.shared.postNotification(OSCreateNotification(
      playerIds: [playerId],
      content: "$body",
      heading: "$title",
    ));

    print("postedDode");
  }
}
