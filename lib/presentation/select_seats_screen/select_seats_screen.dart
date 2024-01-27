import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/core/utils/Cinema/SessionsPerCinema.dart';
import 'package:cinema_ticket_booking_app/core/utils/get_room_api.dart';
import 'package:cinema_ticket_booking_app/core/utils/seat_reserving_api.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:cinema_ticket_booking_app/core/utils/seats_per_room.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cinema_ticket_booking_app/core/utils/credentials_imports.dart';

class SelectSeatsScreen extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

class MyState extends State<SelectSeatsScreen> {
  DateTime? selectedDate; // Declare selectedDate here
  TimeOfDay? selectedTime; // Declare selectedTime here

  List<String> dropdownItemList = [
    "Equalizer 2",
    "Killers of the follower moon",
    "SAW X",
  ];

  List<String> seats = [
    'A1',
    'A2',
    'A3',
    'A4',
    'A5',
    'B1',
    'B2',
    'B3',
    'B4',
    'B5',
    'C1',
    'C2',
    'C3',
    'C4',
    'D1',
    'D2',
    'D3',
    'D4',
    'D5',
    'E1',
    'E2',
    'E3',
    'E4',
    'E5',
  ];
  int max_rows = 12;
  int max_cols = 6;
  var s_h = 30;
  var s_w = 30;
  List<Map<String, List<String>>> mappedSeatMatrix = [
    {
      '0': ['A1#0x0*0/123', 'A2#0x1*0/124', 'A3#0x2*0/125']
    },
    {
      '1': ['B1#1x0*0/126', 'B2#1x1*0/127', 'B3#1x2*0/128', 'B6#1x5*0/129']
    },
    {
      '2': [
        'C1#2x0*2/130',
        'C2#2x1*0/131',
        'C3#2x2*2/132',
        'C4#2x3*0/133',
        'C5#2x4*0/134',
        'C6#2x5*2/135'
      ]
    },
    {
      '4': [
        'E1#4x0*0/136',
        'E2#4x1*0/137',
        'E3#4x2*0/138',
        'E4#4x3*0/139',
        'E5#4x4*0/140',
        'E6#4x5*0/141'
      ]
    },
    {
      '5': [
        'F1#5x0*2/142',
        'F2#5x1*0/143',
        'F3#5x2*2/144',
        'F4#5x3*0/145',
        'F5#5x4*2/146',
        'F6#5x5*0/147'
      ]
    },
    {
      '8': [
        'I1#8x0*0/148',
        'I2#8x1*0/149',
        'I3#8x2*0/150',
        'I4#8x3*0/151',
        'I5#8x4*0/152',
        'I6#8x5*0/153'
      ]
    },
    {
      '9': [
        'J1#9x0*2/154',
        'J2#9x1*0/155',
        'J3#9x2*2/156',
        'J4#9x3*0/157',
        'J5#9x4*2/158',
        'J6#9x5*0/159'
      ]
    },
    {
      '10': ['K1#10x0*0/160', 'K2#10x1*0/161', 'K5#10x4*0/162', 'K6#10x5*0/163']
    },
    {
      '11': ['L1#11x0*2/164', 'L2#11x1*0/165', 'L5#11x4*2/166', 'L6#11x5*0/167']
    },
    // Add more rows as needed
  ];


  Map<String,int> selected = {};
  String radioGroup = "";


  var i = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inside init");
  }
  var session_id = 1;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var receivedArguments = ModalRoute.of(context)!.settings.arguments;
    var room_id = 1;



    // Check if receivedArguments is a Map and contains the 'index' key
    if(receivedArguments is Map) {
      room_id = receivedArguments["room_id"];
      session_id = receivedArguments["Session_id"];
      print("room_id  from arguments is = $room_id  and session_id= $session_id");
    }
    Future<List<dynamic>?> seats = get_seats_per_room(room_id,session_id);


    Future<String?> max_rows_cols = get_max_row_col(room_id) ;



    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: FutureBuilder(
          future: seats,
          builder: _buildfuture,
        ),
        bottomNavigationBar: _buildCheckoutButton(context),
      ),
    );
  }

  Widget _buildfuture(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      print("snaoshit data ${snapshot.hasData}");
      var ls = snapshot.data;
      print(ls);

      print("selected before =$selected");


      if(selected.isEmpty) {
        print("im inside selected");
        for (final row in ls) {
          print("first loop");

          for (final entry in row.entries) {
            final rowNumber = entry.key;
            final seats = entry.value;

            // Process each seat in the row
            for (final seat in seats) {
              final parts = seat.split('*');
              if (parts.length == 2) {
                var seatState = parts[1].split('/')[0];
                selected[seat] = int.parse(seatState);
              }
            }
          }
        }
      }

      print("selected = $selected");

      return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 17.v,
        ),

        child: Column(
          children: [
            SizedBox(height: 12.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "",
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 80.v),
            _buildSeatStack(context,ls),
            SizedBox(height: 46.v),
            _buildInfoSeats(context),
            SizedBox(height: 5.v),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  /// Section Widget


  Widget _buildDateRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    height: 48.v,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? "Select Date"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time",
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 8.v),
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    height: 48.v,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedTime == null
                              ? "Select Time"
                              : "${selectedTime!.hour}:${selectedTime!.minute}",
                        ),
                        Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  /// Section Widget
  Widget _buildSeatStack(BuildContext context, ls) {
    return SizedBox(
      //  height: 380.v,
      width: double.maxFinite,
      child: Column(
        //  alignment: Alignment.topCenter,

        //  alignment: Alignment.topCenter,

        children: [
          CustomImageView(
            imagePath: ImageConstant.imgScreen,
            height: 100.v,
            width: 315.h,
            alignment: Alignment.topCenter,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 280.v,
              width: ((s_w + 15) * max_cols).h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: max_rows,
                  itemBuilder: (context, index) {
                    List<String> rowSeats = fetch_row(index,ls);



                    return (rowSeats != ["a#b"])
                        ? Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(max_cols, (rowIndex) {
                                String actual_location =
                                    "${index.toString()}x${rowIndex.toString()}";
                                //     print("we are at $actual_location");

                                var seat =
                                    check_in_row(rowSeats, actual_location);


                                Color buttonColor = Colors.black;
                                int seat_state = 0;
                                String seat_name = "";
                                String seat_row = "";
                                String seat_col = "";

                                if (seat != "") {
                                  //     print("for column $rowIndex");
                                  List<String> parts = seat.split("#");

                                  if (parts.length == 2) {
                                    seat_name = parts[0];
                                    String seat_location_state = parts[1];

                                    String seat_coordinates_all =
                                        seat_location_state.split("*")[0];
                                    seat_state = int.parse(seat_location_state
                                        .split("*")[1]
                                        .split("/")[0]);

                                    List<String> seat_coordinates =
                                        seat_coordinates_all.split("x");

                                    if (seat_coordinates.length == 2) {
                                      seat_row = seat_coordinates[0];
                                      seat_col = seat_coordinates[1];

/*                                      // Now you can use seat_name, seat_row, and seat_col as needed
                                      print('Seat Name: $seat_name');
                                      print('Seat Row: $seat_row');
                                      print('Seat Column: $seat_col');*/
                                    } else {
                                      print(
                                          'Invalid seat location format: $seat');
                                    }
                                  } else {
                                    print('Invalid seat format: $seat');
                                  }



                                  switch (selected[seat]) {
                                    case 0:
                                      buttonColor = Colors.black;
                                      break;
                                    case 1:
                                      buttonColor = Colors.blue;
                                      break;
                                    case 2:
                                      buttonColor = Colors.red;
                                      break;
                                    default:
                                      buttonColor = Colors.black;
                                      break;
                                  }
                                }

                                return (seat != "")
                                    ? Container(
                                        height: s_h.v,
                                        width: s_w.h,
                                        margin: EdgeInsets.only(left: 10.h),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            //    fixedSize: Size(5,5),

                                            backgroundColor: buttonColor,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () {

                                            print(
                                                '$seat state before pressed = ${selected[seat]}');
                                            setState(() {
                                              if(selected[seat]==0){
                                                selected[seat]=1;
                                              }else if(selected[seat]==1){
                                                selected[seat]=0;
                                              } else{
                                                selected[seat]=2;
                                              }
                                            });
                                          },
                                          child: Text(seat_name),
                                        ),
                                      )
                                    : Container(
                                        width: s_w.h,
                                        height: s_h.v,
                                        margin: EdgeInsets.only(left: 10.h),
                                      );
                              }),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(top: 30.v),
                            child: Text("wWIII SAL3A"),
                          );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  check_in_row(List<String> row_seats, String location) {
    var seat = "";
    for (seat in row_seats) {
      List parts = seat.split("#");
      List parts2 = parts[1].split("*");
      String seat_location = parts2[0];

      if (seat_location == location) {
        // print("actual location will be printed");
        return seat;
      }
    }

    return "";
  }

  Future<List<dynamic>?> get_seats_per_room(room_id,session_id) async {
    List<Map<String, dynamic>>? seats = await endpoint_api_get_seats_per_room(room_id,session_id);


    return seats;
  }


  Future<String?> get_max_row_col(int room_id) async{


  Map<String,dynamic>? res = await endpoint_api_get_room(room_id);
  String? max_rows_cols = "${res?['Room_max_row']}x${res?['Room_max_col']}";
  max_rows = int.parse(max_rows_cols.toString().split("x")[0]);
  max_cols = int.parse(max_rows_cols.toString().split("x")[1]);

  return max_rows_cols;

  }
  fetch_row(int row_index, ls) {

    var returned = ["a#b"];

    for (var map in ls) {


      Iterable<String> key = map.keys;
      var original_key = key.first;
      if (original_key == row_index.toString()) {

        returned = map[original_key]!;
      }
    }

    return returned;
  }

  /// Section Widget
  Widget _buildInfoSeats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10.adaptSize,
          width: 10.adaptSize,
          margin: EdgeInsets.only(
            top: 4.v,
            bottom: 3.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.blue400,
            borderRadius: BorderRadius.circular(
              5.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "Selected",
            style: CustomTextStyles.bodySmallBluegray200,
          ),
        ),
        Spacer(
          flex: 54,
        ),
        Container(
          height: 10.adaptSize,
          width: 10.adaptSize,
          margin: EdgeInsets.only(
            top: 4.v,
            bottom: 3.v,
          ),
          decoration: BoxDecoration(
            color: appTheme.red400,
            borderRadius: BorderRadius.circular(
              5.h,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "Reserved",
            style: CustomTextStyles.bodySmallBluegray200,
          ),
        ),
        Spacer(
          flex: 45,
        ),
        CustomRadioButton(
          text: "Available",
          value: "Available",
          groupValue: radioGroup,
          onChange: (value) {
            radioGroup = value;
          },
        ),
      ],
    );
  }

  Widget _SetColor(BuildContext context) {
    return Text("hello world");
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        print(selected);


        var sum_selected = 0;
        List<dynamic> only_selected = [];

        for( var item in selected.entries){
          var key = item.key;
          var val = item.value;
          if(val==1){
            sum_selected++;
            only_selected.add(item);

          }



        }

        (sum_selected>0) ?_showConfirmationDialog(context,only_selected) : _showToast();
      },
      text: "Checkout",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 28.v,
      ),
    );
  }
  void _showToast() {
    Fluttertoast.showToast(
      msg: "At least Select one Seat ! ",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  void _showConfirmationDialog(BuildContext context,only_selected) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
        title: Container(
          color: Colors.blueGrey,
          padding: EdgeInsets.all(30.v),
          child : Text(
            "Are you sure you want to proceed?",
          selectionColor: Colors.blue,
        ),
        ),


        actions: <Widget>[
          TextButton(
            style : TextButton.styleFrom(
              foregroundColor: Colors.red,

        ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("No"),
          ),
          TextButton(
            style : TextButton.styleFrom(
              foregroundColor: Colors.blue,

            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _perform_Synch(only_selected);
              _proceedToPaymentSuccessScreen(context);
            },
            child: Text("Yes"),
          ),
        ],
        );
      },
    );
  }
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      centerTitle: true,
      title: AppbarTitle(
        text: "Select Seats",
      ),
    );
  }
  void _proceedToPaymentSuccessScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settingsScreen);
  }
  void _perform_Synch(only_selected) async{
    var key,value;
    int seat_id = 2;
    int session = int.parse(session_id.toString());


    for(var item in only_selected){
      key = item.key;
      value = item.value;
      seat_id = int.parse(key.split("/")[1]);
      print("seat id = $seat_id, and session_id = $session_id");

      print(" seat_id that will be reserbed =  $seat_id");
      int seat_in_session_id = await endpoint_edit_seat(session_id=session, seat_id=seat_id);
      var creds  = await readCounter();
      int user_id = creds["id"];
      print("after completing endpooint_edit_seat with seat_in_session = $seat_in_session_id");
      await endpoint_generate_ticket(user_id, seat_in_session_id);



      setState(() {
        selected = {};

      });

      print("completing perform_synch");

    }
    print("only selcted = $only_selected");
  }

}
