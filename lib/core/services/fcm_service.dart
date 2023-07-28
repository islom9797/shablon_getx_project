import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../data/database/db_service.dart';
import 'log_service.dart';

@pragma('vm:entry-point')
void handleMsgBack(NotificationResponse? message) async {
  FCMService.handleMsg(message);
}

class FCMService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.max);

  static initNotifChannel() async {
    var initAndroidSetting =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initIosSetting = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(
        android: initAndroidSetting, iOS: initIosSetting);
    await plugin.initialize(initSetting,
        onDidReceiveNotificationResponse: handleMsg,
        onDidReceiveBackgroundNotificationResponse: handleMsgBack);
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Foreground
  static void handleMsg(NotificationResponse? message) async {
    if (!DBService().isLoggedIn() || message?.payload == null) return;

    LogService.d(message?.payload);

    // var fcmNotification = FcmNotification.fromJson(
    //   jsonDecode(message!.payload!),
    // );
    // getUntilHome();
    // if (fcmNotification.type == 'EVENT') return;
    //
    // if (fcmNotification.orderId != null) {
    //   // Get.find<NotificationsController>()
    //   //     .getOrderById(fcmNotification.orderId!);
    // }
  }

  static getFirebaseToken() async {
    _firebaseMessaging.getToken().then((value) {
      String fcmToken = value.toString();
      DBService.to.setFirebaseToken(fcmToken);
      developer.log("FCM Token: ${DBService.to.getFirebaseToken()}");
    });
  }

  static Future<String> getFCMTokenFromDB() async {
    String fcmToken = DBService.to.getFirebaseToken();
    if (fcmToken.isNotEmpty) return fcmToken;
    String? value = await _firebaseMessaging.getToken();
    DBService.to.setFirebaseToken(value);
    return DBService.to.getFirebaseToken();
  }

  static initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    // Foreground state
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // Get.find<NotificationsController>().onRefresh();
      showLocalNotification(message.notification, message.data);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  // Background state
  static Future<void> handleMessage(RemoteMessage message) async {
    if (!DBService().isLoggedIn() || message.data.isEmpty) return;
    // Get.find<NotificationsController>().onRefresh();
    // var fcmNotification = FcmNotification.fromJson(message.data);
    // getUntilHome();
    // if (fcmNotification.type == 'EVENT') return;
    //
    // if (fcmNotification.orderId != null) {
    //   Get.find<NotificationsController>()
    //       .getOrderById(fcmNotification.orderId!);
    // }
  }

  // Terminated state.
  static Future<void> getInitialNotification() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.getNotificationSettings();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      var initialMessage = await _firebaseMessaging.getInitialMessage();
      if (initialMessage == null || initialMessage.data.isEmpty) return;
      // var fcmNotification = FcmNotification.fromJson(initialMessage.data);
      // getUntilHome();
      // if (fcmNotification.type == 'EVENT') return;
      // if (fcmNotification.orderId != null) {
      //   Get.find<NotificationsController>()
      //       .getOrderById(fcmNotification.orderId!);
      // }
    }
  }

  // Terminated when notification received in foreground
  static Future<void> getUntappedLocalNotification() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;
    var details = await plugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      handleMsg(details.notificationResponse);
    }
  }

  static Future<void> showLocalNotification(RemoteNotification? notification,
      Map<String, dynamic> notificationData) async {
    var android = AndroidNotificationDetails(channel.id, channel.name,
        channelDescription: channel.description,
        importance: Importance.max,
        priority: Priority.high);
    var iOS = const DarwinNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    int id = Random().nextInt((pow(2, 31) - 1).toInt());
    await plugin.show(
      id,
      notification?.title ?? "",
      notification?.body ?? "",
      platform,
      payload: jsonEncode(notificationData),
    );
  }

  static void getUntilHome() {
    if (Get.currentRoute != "/MainPage") {
      Get.until((route) => Get.currentRoute == '/MainPage');
    }
    // if (Get.find<MainController>().tabIndex != 2) {
    //   Get.find<MainController>().pageChanged(2);
    // }
  }
}
