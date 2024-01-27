
import 'dart:ffi';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/movie_sessions_page/movie_sessions_page.dart';
import 'package:cinema_ticket_booking_app/presentation/details_page/details_page.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MovieSessionsTabContainerScreen extends StatefulWidget {
  const MovieSessionsTabContainerScreen({Key? key}) : super(key: key);

  @override
  MovieSessionsTabContainerScreenState createState() =>
      MovieSessionsTabContainerScreenState();
}

class MovieSessionsTabContainerScreenState
    extends State<MovieSessionsTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  bool isAboutTabActive = true;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);

    // Listen for manual tab changes
    tabviewController.addListener(() {
      setState(() {
        isAboutTabActive = tabviewController.index == 0;
      });
    });
  }

  int upcoming = 0;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    var args = (ModalRoute.of(context)!.settings.arguments);


    if(args is Map){
      upcoming = args["upcoming"];


    }
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildFixed(context),
              Expanded(
                child: SizedBox(
                  height: 656.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [

                      DetailsPage() ,
                       MovieSessionsPage() ,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
  Widget _buildFixed(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 10.h,),
            Container(
              height: 36.v,
              width: 748.h,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isAboutTabActive = true;
                          tabviewController.animateTo(0);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "About",
                            style: TextStyle(
                              color: isAboutTabActive ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.h),
                   upcoming!=1 ?
                   Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isAboutTabActive = false;
                          tabviewController.animateTo(1);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Sessions",
                            style: TextStyle(
                              color: !isAboutTabActive ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  : Text("")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        centerTitle: true,
        title: AppbarTitle(text: "Sessions Available"));
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}