

import 'dart:ffi';

import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/movie_sessions_page/movie_sessions_page.dart';
import 'package:cinema_ticket_booking_app/presentation/details_page/details_page.dart';
import 'package:cinema_ticket_booking_app/presentation/sessionpercinema_screen/sessionpercinema_screen.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../sessionpercinema_screen/widgets/userprofile_item_widget.dart';

import '../../core/utils/Cinema/SessionsPerCinema.dart';

class SessionpercinemaScreen extends StatefulWidget {
  const SessionpercinemaScreen({Key? key}) : super(key: key);

  @override
  SessionpercinemaScreenState createState() =>
      SessionpercinemaScreenState();
}

class SessionpercinemaScreenState
    extends State<SessionpercinemaScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;
  bool isAboutTabActive = true;
  int day=0;
  int k=8;
DateTime now = DateTime.now();

   final List<String> tabTitles = [];
   int i=0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();



  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: k, vsync: this);
    for(int i =0;i<k;i++){
      if(i==0) {
        tabTitles.add("today");
      }else if(i==1){
        tabTitles.add("tomorrow");

      } else {
        String date_after = dateFormatter(i);
        tabTitles.add(date_after);
      }
    }

    // Listen for manual tab changes
    tabviewController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    var args = ModalRoute.of(context)!.settings.arguments;
    var cinema_id = 1;
    Future<List<dynamic>?> Sessions = get_All_Sessions(cinema_id);

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
                  child : TabBarView(
                  controller: tabviewController,
                  children: List.generate(
                    tabTitles.length,
                        (index) => Session_per_cinema(context, Sessions),
                  ),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tabTitles.length,
                itemBuilder: (context, index) {
/*                  print("index now is $index ");
                  print("day now is $day");*/
                  return Padding(
                    padding: (index!=0) ? EdgeInsets.only(right : 60.00) :EdgeInsets.only(left : 20,right : 60)  ,
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            day = index;
                            tabviewController.animateTo(day);
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
                              tabTitles[index],
                              style: TextStyle(
                                fontSize: 15,
                                color: (day==index) ? Colors.red : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
        leading: Text(""),
        title: AppbarTitle(text: "Sessions Available"));
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
      index : 2,
    );
  }
  Widget Session_per_cinema(BuildContext context,Sessions){

    return SafeArea(
        child: Scaffold(

          body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 21.v),
              child: Column(children: [
                SizedBox(height: 5.v),
                SizedBox(
                  width: 30.v,
                  height: 30.h,
                ),
                Expanded(child: FutureBuilder( future:  Sessions, builder: _buildUserProfile,))
              ])),
        )
    );
  }
  Future<List<dynamic>?> get_All_Sessions(cinema_id) async {
    List<dynamic>? list = await endpoint_api_get_sessions_per_cinema(cinema_id);
    print("list of sessions $list");
    return list;
  }
  Widget _buildUserProfile(BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.hasData) {
      List<Map> Sessions = snapshot.data;
      return Container(
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 1.v);
              },
              itemCount: Sessions!.length,
              itemBuilder: (context, index) {
                String? title = (Sessions?[index]["Movie_title"]);
                String? date = Sessions?[index]["Session_time"];
                // extarct day from date ;
                String? lang = Sessions?[index]["Session_version"];
             //   String? img =  Sessions?[index]["Movie_image"];
                String? img =  "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rkv0HAzhHeZbc70JW224rUy1cMk.jpg";

                DateTime session_date = DateTime.parse(date!);

                DateTime now = DateTime.now();
                DateTime after_days_date = now.add(Duration(days: day));

/*                print("after days"+after_days_date.toString());
                print("session date" + session_date.toString());

                print("number of days is"+  date);*/

                var session_room = Sessions[index]["Session_room"];





                DateTime time = DateTime.parse(date!);
                String formatted_time = DateFormat("HH:MM").format(time);

                bool display = true;

                if(after_days_date.year==session_date.year && after_days_date.month==session_date.month && after_days_date.day==session_date.day){
                  display = true;
                }else{
                  display=false;
                }


                return display ? UserprofileItemWidget(
                    movie_hour: formatted_time,
                    movie_title: title,
                    movie_img: img,
                    movie_lang: lang,
                    onTapImgUserImage: () {
                      onTapImgUserImage(context,Sessions?[index]);
                    }
                )
                    :
                SizedBox(height: 0,);

              })
      );
    }else {
      print("44444444444444444444444444444");
      return Text("${snapshot.hasError}");
    }
    return CircularProgressIndicator();
  }

  onTapImgUserImage(BuildContext context, session) {
    print("inside onTap =  $session");
    Navigator.pushNamed(context, AppRoutes.selectSeatsScreen, arguments: { 'room_id' : session['Session_room'], 'Session_id' : session['Session_ID'] },);
  }
  dateFormatter(int i){
    DateTime now = DateTime.now();
    DateTime afer_i_days = now.add(Duration(days: i));
    String formatted_date = DateFormat("dd MMMM yyyy").format(afer_i_days);
    return formatted_date;

  }


}

