import 'dart:io';

import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/home_screen/home_screen.dart';

import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';

import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:readmore/readmore.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import "package:cinema_ticket_booking_app/core/utils/api_endpoints.dart";

class ETicketScreen extends StatefulWidget {
  const ETicketScreen({Key? key}) : super(key: key);

  @override
  _ETicketScreenState createState() => _ETicketScreenState();
}

class TicketData {
  final String film;
  final String date;
  final String seats;
  final String location;
  final String cinema;
  final String time;
  final String ticket_time;
  final String Ticket_barcode;
  final String paymentStatus; // Make sure you fetch this from the appropriate PHP column
  final String orderNumber; // Make sure you fetch this from the appropriate PHP column

  TicketData({
    required this.film,
    required this.date,
    required this.seats,
    required this.location,
    required this.cinema,
    required this.time,
    required this.ticket_time,
    required this.Ticket_barcode,
    required this.paymentStatus,
    required this.orderNumber,
  });

  // Factory method to create a TicketData object from JSON
  factory TicketData.fromJson(Map<String, dynamic> json) {
    return TicketData(
      film: json['film'],
      date: json['date'],
      seats: json['seats'],
      location: json['location'],
      cinema: json['cinema'],
      time: json['time'],
      ticket_time: json['ticket_time'],
      Ticket_barcode: json['Ticket_barcode'],
      paymentStatus: json['paymentStatus'],
      orderNumber: json['orderNumber'],
    );
  }
}


class _ETicketScreenState extends State<ETicketScreen> {
  List<TicketData> tickets = [];

  @override
  void initState() {
    super.initState();
    // Call the function to fetch ticket data when the widget is first created
    fetchTicketData();
  }
  Future<String> get _localPath async{

    final directory = await getApplicationDocumentsDirectory();
    return directory.path;


  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/credentials.json');
  }
  Future<void> writeCredentials(user_id,username,email,password,phonenumber) async {
    final file = await _localFile;


    Map<String,dynamic> creds = {
      "id" : user_id,
      "username" : username.toString(),
      "password" : email.toString(),
      "email" : password.toString(),
      "phonenumber" : phonenumber.toString(),
    };
    String jsonmap = jsonEncode(creds);

    // Write the file
    file.writeAsString(jsonmap);
  }
  Future<Map> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      Map<String,dynamic> mapObj = jsonDecode(contents);
      print("read counter is called");
      print(mapObj);
      return mapObj;

    } catch (e) {
      // If encountering an error, return 0
      return {};
    }
  }

  Future<void> fetchTicketData() async {
    Map creds = await readCounter();
    int user_id = creds["id"];

    final response = await http.get(Uri.parse("${Endpoints.get_tickets}?user_id=$user_id"));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      List<dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse);

      // Map each JSON object to a TicketData object
      print("before");
      List<TicketData> ticketList = jsonResponse.map((json) {
        DateTime dateTime = DateTime.parse(json['session_time']);
        String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
        DateTime dateTime2 = DateTime.parse(json['ticket_time']);
        String date2 = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime2);
        return TicketData(
          film: json['film'],
          date: formattedDate,
          seats: json['seat'],
          location: json['location'],
          cinema: json['cinema'],
          time: json['ticket_time'],
          ticket_time: date2,
          Ticket_barcode: json['Ticket_barcode'],
          paymentStatus: json['payementStatus'],
          orderNumber: json['orderNumber'],
        );
      }).toList();

      print("after listing");

      // Update the state to trigger a rebuild of the widget with the fetched data
      setState(() {
        tickets = ticketList;
        print(tickets);
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load ticket data');
    }
  }



  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 17.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.v),
                child: Text(
                  "Instruction",
                  style: CustomTextStyles.titleLarge_1,
                ),
              ),
              SizedBox(height: 12.v),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 315.v,
                  margin: EdgeInsets.symmetric(horizontal: 30.v),
                  child: Text(
                    "Come to the cinema, show and scan the barcode to the space provided. Continue to comply with health protocols.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: CustomTextStyles.bodyMediumPoppinsBluegray200Light.copyWith(
                      height: 1.57.v,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 39.v),

              _buildFilmShangChi(context),

              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildDownloadETicketButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.v,
      settings: true,

      centerTitle: true,
      title: AppbarTitle(
        text: "E-Ticket",
      ),
    );
  }


  Widget _buildFilmShangChi(BuildContext context) {

    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 30.v),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: tickets.map((ticket) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.v),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgETicket1,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(40.v),
                  width: 350.v, // Adjust the width for the ticket
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      SizedBox(height: 15.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.v,
                          right: 60.h,
                        ),
                        child: _buildFilmShangChiText(context, ticket.film),
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        width: 300.v,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ticket Issue Date",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  ticket.ticket_time,
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],

                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(

                                  "Seat",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 8.h),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ticket.seats.split("#")[0],

                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 40.h),
                      Container(
                        width: 300.v,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(

                                  " Cinema",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  ticket.cinema,

                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(

                                  "Session Time",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  ticket.date,

                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 8.h),
                      Container(
                        width: 300.v,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                "",//  "Ticket Time: ${ticket.ticket_time}",
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgBarcode,
                        height: 100.h,
                        width: 300.v,
                        alignment: Alignment.center,
                      ),
                      // ... Other widgets
                    ],
                  ),
                ),
              );
            }).toList(),

          ),
        ),
      ),
    );
  }


  Widget _buildDownloadETicketButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Download E-Ticket",
      margin: EdgeInsets.only(
        left: 30.v,
        right: 30.v,
        bottom: 30.h,
      ),
      onPressed: () {
        _showDownloadETicketPopup(context);
      },
    );
  }


  Widget _buildFilmShangChiText(BuildContext context, String film) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity, // Expand to the maximum width
          child: Text(
            film,
            style: CustomTextStyles.titleMediumBlack900.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Positioned(
          //right: 1.v,
          child: Text(
            "e-ticket",
            style: CustomTextStyles.titleMediumRed40002.copyWith(
              color: appTheme.red40002,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopupColumn(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.all(30),
          decoration: AppDecoration.fillBlue.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL60,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 43.h),
              Container(
                width: 250.v,
                margin: EdgeInsets.only(
                  left: 31.v,
                  right: 33.h,
                ),
                child: Text(
                  "Your ticket has been downloaded",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
              ),

              SizedBox(height: 16.v),
              SizedBox(
                width: 302.h,
                child: ReadMoreText(
                  "Adele is a Scottish heiress whose extremely\nwealthy family owns estates and grounds.\nWhen she was a teenager.",
                  trimLines: 3,
                  colorClickableText: appTheme.whiteA70001,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Read More",
                  moreStyle: CustomTextStyles.bodyMediumPoppinsLight.copyWith(

                    height: 1.57.v,
                  ),
                  lessStyle: CustomTextStyles.bodyMediumPoppinsLight.copyWith(
                    height: 1.57.v,
                  ),
                ),
              ),
              SizedBox(height: 32.v),
              CustomElevatedButton(
                text: "Back To Home",
                buttonStyle: CustomButtonStyles.outlinePrimaryTL121,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 112.adaptSize,
            width: 112.adaptSize,
            margin: EdgeInsets.only(bottom: 293.h),
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 29.h,
            ),
            decoration: AppDecoration.outlineWhiteA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder56,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgDownload,
              height: 46.h,
              width: 39.v,
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }


  /// Common widget
  Widget _buildNineteen(
    BuildContext context, {
    required String orderLabel,
    required String orderValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderLabel,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.gray60004,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          orderValue,
          style: CustomTextStyles.titleSmallBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
  void _showDownloadETicketPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Set the background color to be transparent
      builder: (BuildContext context) {
        return _buildPopupColumn(context);
      },
    );
  }


}



