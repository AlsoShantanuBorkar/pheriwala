import 'dart:developer';

import 'package:be_project/apis/user_api.dart';
import 'package:be_project/apis/vendor_api.dart';
import 'package:be_project/firebase_options.dart';
import 'package:be_project/models/user_model.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:be_project/providers/location_provider.dart';
import 'package:be_project/providers/user_data_provider.dart';
import 'package:be_project/providers/vendor_data_provider.dart';
import 'package:be_project/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

String token = "";

late final Isar isarInstance;
late final SharedPreferences sharedPreferencesInstance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  isarInstance = await Isar.open(
    [UserModelSchema, VendorModelSchema],
    directory: await getApplicationDocumentsDirectory().then(
      (value) => value.path,
    ),
  );
  sharedPreferencesInstance = await SharedPreferences.getInstance();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  log('User granted permission: ${settings.authorizationStatus}');

  await messaging.getToken().then(
    (value) {
      token = value!;
      log(value.toString());
    },
  );

  FirebaseMessaging.onMessageOpenedApp.listen(
    (RemoteMessage message) {},
  );

  FirebaseMessaging.onBackgroundMessage(
    _firebaseMessagingBackgroundHandler,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorDataProvider(
            VendorApi(),
            isarInstance,
            sharedPreferencesInstance,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDataProvider(
            UserApi(),
            isarInstance,
            sharedPreferencesInstance,
          ),
        ),
      ],
      child: MaterialApp(
          title: 'Pheriwala',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen()),
    );
  }
}
