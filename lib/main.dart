import 'dart:io';
import 'package:cinema_ticket_booking_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cinema_ticket_booking_app/theme/theme_helper.dart';
import 'package:cinema_ticket_booking_app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'api/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await FirebaseApi().initNotifications();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// Please update the theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Cinema Ticket Reservation',
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.homeScreen,
      routes: AppRoutes.routes,
    );
  }
}
