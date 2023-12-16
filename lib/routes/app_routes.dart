import 'package:cinema_ticket_booking_app/presentation/categories_screen/categories.dart';
import 'package:cinema_ticket_booking_app/presentation/details_page/details_page.dart';
import 'package:cinema_ticket_booking_app/presentation/explore_page/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:cinema_ticket_booking_app/presentation/all_cinemas_screen/all_cinemas_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/sessionpercinema_screen/sessionpercinema_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/cinema_description_screen/cinema_description_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/home_screen/home_screen.dart';
//import 'package:cinema_ticket_booking_app/presentation/explore_tab_container_screen/explore_tab_container_screen.dart';
//import 'package:cinema_ticket_booking_app/presentation/details_tab_container_screen/details_tab_container_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/select_seats_screen/select_seats_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/checkout_screen/checkout_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/payment_success_screen/payment_success_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/login_screen/login_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/e_ticket_screen/e_ticket_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/download_e_ticket_screen/download_e_ticket_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/movie_sessions_tab_container_screen/movie_sessions_tab_container_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/saved_plan_screen/saved_plan_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/settings_screen/settings_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String allCinemasScreen = '/all_cinemas_screen';

  static const String sessionpercinemaScreen = '/sessionpercinema_screen';

  static const String cinemaDescriptionScreen = '/cinema_description_screen';

  static const String categories  = '/categories';

  static const String homeScreen = '/home_screen';

  static const String explorePage = '/explore_page';


  static const String exploreTabContainerScreen =
      '/explore_tab_container_screen';

  static const String detailsPage = '/details_page';

  static const String detailsTabContainerScreen =
      '/details_tab_container_screen';

  static const String selectSeatsScreen = '/select_seats_screen';

  static const String checkoutScreen = '/checkout_screen';

  static const String paymentSuccessScreen = '/payment_success_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String eTicketScreen = '/e_ticket_screen';

  static const String downloadETicketScreen = '/download_e_ticket_screen';

  static const String movieSessionsPage = '/movie_sessions_page';

  static const String movieSessionsTabContainerScreen =
      '/movie_sessions_tab_container_screen';

  static const String savedPlanScreen = '/saved_plan_screen';

  static const String settingsScreen = '/settings_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    allCinemasScreen: (context) => AllCinemasScreen(),
    sessionpercinemaScreen: (context) => SessionpercinemaScreen(),
    cinemaDescriptionScreen: (context) => CinemaDescriptionScreen2(),
    homeScreen: (context) => HomeScreen(),
    explorePage: (context) => ExplorePage(),
    detailsPage: (context) => DetailsPage(),
    selectSeatsScreen: (context) => SelectSeatsScreen(),
    checkoutScreen: (context) => CheckoutScreen(),
    paymentSuccessScreen: (context) => PaymentSuccessScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    eTicketScreen: (context) => ETicketScreen(),
    downloadETicketScreen: (context) => DownloadETicketScreen(),
    movieSessionsTabContainerScreen: (context) =>
        MovieSessionsTabContainerScreen(),
    savedPlanScreen: (context) => SavedPlanScreen(),
    settingsScreen: (context) => SettingsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    categories : (context) => FilmCategories(),
  };
}
