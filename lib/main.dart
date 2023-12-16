import 'package:cinema_ticket_booking_app/core/utils/Cinema/cinema.dart';
import 'package:cron/cron.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:cinema_ticket_booking_app/theme/theme_helper.dart';
import 'package:cinema_ticket_booking_app/routes/app_routes.dart';

final dio = Dio();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final cron = Cron();
  // cron.schedule(Schedule.parse('*/10 * * * * *'), () async {
  //   service_sync_cinemas();
  // });

  ///Please update theme as per your need if required.
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
      initialRoute: AppRoutes.loginScreen,
      routes: AppRoutes.routes,
    );
  }
}

