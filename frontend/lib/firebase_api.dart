import 'package:firebase_core/firebase_core.dart';
import 'package:predict_pro/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message title: ${message.notification?.title}");
  print("Handling a background message body: ${message.notification?.body}");
  print("Handling a background message data: ${message.data}");
}

class FirebaseApi {

  final fbm = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
  print("Token test1");
  await fbm.requestPermission();
  print("Token test2");
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("Token $fcmToken");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}