import 'dart:convert';

import 'package:cinema_ticket_booking_app/core/utils/api_endpoints.dart';
import 'package:cinema_ticket_booking_app/presentation/movie_sessions_page/widgets/sessionlist_item_widget.dart';
import 'package:intl/intl.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MovieSessionsPage extends StatefulWidget {
  const MovieSessionsPage({Key? key}) : super(key: key);

  @override
  MovieSessionsPageState createState() => MovieSessionsPageState();
}

class MovieSessionsPageState extends State<MovieSessionsPage>
    with SingleTickerProviderStateMixin {
  bool isSelectedSwitch = false;
  List<String> tabTitles = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    tabTitles = generateTabTitles();
    _tabController = TabController(length: tabTitles.length, vsync: this);
  }

  List<String> generateTabTitles() {
    List<String> titles = [];
    for (int i = 0; i < 7; i++) {
      if (i == 0) {
        titles.add('Today');
      } else if (i == 1) {
        titles.add('Tomorrow');
      } else {
        DateTime dateAfter = DateTime.now().add(Duration(days: i));
        String formattedDate = DateFormat('dd MMMM yyyy').format(dateAfter);
        titles.add(formattedDate);
      }
    }
    return titles;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: Column(
            children: [
              _buildControls(context),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          tabs: tabTitles
                              .map((title) => Tab(
                            child: Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ))
                              .toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: List.generate(
                          tabTitles.length,
                              (index) => _buildSessionList(context, index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControls(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(
            flex: 53,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              children: [
                // Add any controls or widgets you want here
              ],
            ),
          ),
          Spacer(
            flex: 46,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              children: [
                SizedBox(height: 2.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionList(BuildContext context, int day) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 30.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: FutureBuilder<List<dynamic>?>(
          future: getSessionsForDay(day),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No sessions available for this day');
            } else {
              List<dynamic> sessions = snapshot.data!;
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return SessionlistItemWidget(
                    showAdditionalInfo: true,
                    filmImage: sessions[index]['Session_movie__Image_path'],
                    MovieName: sessions[index]['Session_movie__Movie_title'],
                    version: sessions[index]['Session_version'],
                    sessionTime: sessions[index]['Session_time'],
                    price: sessions[index]['Session_price'].toString(), // Assuming Session_price is an integer
                    RoomNumber: sessions[index]['Session_room__Room_number'],
                    remainingPlaces: 20, // You may need to update this based on your data structure
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
/*
  Future<List<dynamic>?> getSessionsForDay(int day) async {
    // Add your logic to fetch sessions based on the selected day
    // Simulating data for demonstration
    await Future.delayed(Duration(seconds: 2));
    return [
      {'version': 'French', 'sessionTime': '14:40'},
      {'version': 'English', 'sessionTime': '18:30'},
      // Add more session data as needed
    ];
  }*/
  Future<List<dynamic>?> getSessionsForDay(int day) async {
    // Replace 'YOUR_API_ENDPOINT' with the actual API endpoint for fetching sessions
    final apiUrl = Endpoints.getFilteredSessions(1);

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the response data (assuming it's a list of sessions)
        List<dynamic> allSessions = json.decode(response.body)['sessions'];

        // Filter sessions for the selected day
        List<dynamic> sessionsForDay = allSessions
            .where((session) {
          DateTime sessionDate = DateTime.parse(session['Session_time']);
          DateTime selectedDate = DateTime.now().add(Duration(days: day));

          // Check if the session date matches the selected date
          return sessionDate.year == selectedDate.year &&
              sessionDate.month == selectedDate.month &&
              sessionDate.day == selectedDate.day;
        })
            .toList();

        print('Response Body: ${response.body}');
        return sessionsForDay;
      } else {
        print('Error: Failed to fetch sessions. Status code: ${response.statusCode}');
        print('Response Body: ${response.body}'); // Add this line to print the response body
        return null;
      }
    } catch (error) {
      print('Error in getSessionsForDay: $error');
      return null;
    }
  }
}

