import 'dart:io';

import 'package:alice_lightweight/alice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../data/database/db_service.dart';
import 'fcm_service.dart';

@pragma('vm:entry-point')
Future<void> handleMessage(RemoteMessage message) async {
  FCMService.handleMessage(message);
}

class RootService {
  static Alice alice = Alice();

  static Future<void> init() async {

    // Database
    await DBService.init();

    // Firebase
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
   await Firebase.initializeApp( );
    await FCMService.getFirebaseToken();
    await FCMService.initNotifChannel();
    await FCMService.initNotification();
    FirebaseMessaging.onBackgroundMessage(handleMessage);

    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    initializeDateFormatting();
  }
}
