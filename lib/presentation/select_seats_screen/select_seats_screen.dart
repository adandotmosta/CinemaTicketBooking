import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/core/utils/Cinema/SessionsPerCinema.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:cinema_ticket_booking_app/core/utils/sessions_per_room.dart';

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
  var s_h = 20;
  var s_w = 60;
  List<Map<String, List<String>>> mappedSeatMatrix = [
    {'0': ['A1#0x0', 'A2#0x1', 'A3#0x2']},
    {'1': ['B1#1x0', 'B2#1x1', 'B3#1x2', 'B6#1x5']},
    {'2': ['C1#2x0', 'C2#2x1', 'C3#2x2', 'C4#2x3', 'C5#2x4', 'C6#2x5']},
    //{'3': ['D1#3x0', 'D2#3x1', 'D3#3x2', 'D4#3x3', 'D5#3x4', 'D6#3x5']},
    {'4': ['E1#4x0', 'E2#4x1', 'E3#4x2', 'E4#4x3', 'E5#4x4', 'E6#4x5']},
    {'5': ['F1#5x0', 'F2#5x1', 'F3#5x2', 'F4#5x3', 'F5#5x4', 'F6#5x5']},
  //  {'6': ['G1#6x0', 'G2#6x1', 'G5#6x4', 'G6#6x5']},
   // {'7': ['H1#7x0', 'H2#7x1', 'H5#7x4', 'H6#7x5']},
    {'8': ['I1#8x0', 'I2#8x1', 'I3#8x2', 'I4#8x3', 'I5#8x4', 'I6#8x5']},
    {'9': ['J1#9x0', 'J2#9x1', 'J3#9x2', 'J4#9x3', 'J5#9x4', 'J6#9x5']},
    {'10': ['K1#10x0', 'K2#10x1', 'K5#10x4', 'K6#10x5']},
    {'11': ['L1#11x0', 'L2#11x1', 'L5#11x4', 'L6#11x5']},
    // Add more rows as needed
  ];
  final List<List<String>> seatMatrix = [
    ['A1#0x0', 'A2#0x1', 'A3#0x2'],
    ['B1#1x0', 'B2#1x1', 'B3#1x2', 'B6#1x5'],
    ['C1#2x0', 'C2#2x1', 'C3#2x2', 'C4#2x3', 'C5#2x4', 'C6#2x5'],
    ['D1#3x0', 'D2#3x1', 'D3#3x2', 'D4#3x3', 'D5#3x4', 'D6#3x5'],
    ['E1#4x0', 'E2#4x1', 'E3#4x2', 'E4#4x3', 'E5#4x4', 'E6#4x5'],
    ['F1#5x0', 'F2#5x1', 'F3#5x2', 'F4#5x3', 'F5#5x4', 'F6#5x5'],
    ['G1#6x0', 'G2#6x1', 'G5#6x4', 'G6#6x5'],
    ['H1#7x0', 'H2#7x1', 'H5#7x4', 'H6#7x5'],
    ['I1#8x0', 'I2#8x1', 'I3#8x2', 'I4#8x3', 'I5#8x4', 'I6#8x5'],
    ['J1#9x0', 'J2#9x1', 'J3#9x2', 'J4#9x3', 'J5#9x4', 'J6#9x5'],
    ['K1#10x0', 'K2#10x1', 'K5#10x4', 'K6#10x5'],
    ['L1#11x0', 'L2#11x1', 'L5#11x4', 'L6#11x5'],
    // Add more rows as needed
  ];

  String radioGroup = "";
  Map<String, int> Selected_Items = {
    'A1': 0,
    'A2': 0,
    'A3': 2,
    'A4': 0,
    'A5': 0,
    'B1': 2,
    'B2': 2,
    'B3': 0,
    'B4': 2,
    'B5': 0,
    'C1': 0,
    'C2': 0,
    'C3': 0,
    'C4': 0,
    'D1': 0,
    'D2': 2,
    'D3': 0,
    'D4': 0,
    'D5': 0,
    'E1': 0,
    'E2': 2,
    'E3': 0,
    'E4': 0,
    'E5': 0,
  };


  var i = 0;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < 30; i++) {
      seats.add("Y$i");
      Selected_Items["Y$i"] = 0;
    }

    for (final row in mappedSeatMatrix) {
      for (final key in row.keys) {
        print('Row Number: $key');
      }
    }

    //endpoint_api_get_room();


  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
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
                  "The movie will take palace in room 3",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              SizedBox(height: 20.v),
              _buildDateRow(context),
              SizedBox(height: 50.v),
              _buildSeatStack(context),
              SizedBox(height: 46.v),
              _buildInfoSeats(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildCheckoutButton(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      centerTitle: true,
      title: AppbarTitle(
        text: "Select Seats",
      ),
    );
  }

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
  Widget _buildSeatStack(BuildContext context) {
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


                    List<String> rowSeats = fetch_row(index);

                    print('after fetch in index=$index with rowSeats : $rowSeats');

                    return (rowSeats!=["a#b"])
                        ? Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(max_cols, (rowIndex) {
                                String actual_location =
                                    "${index.toString()}x${rowIndex.toString()}";
                           //     print("we are at $actual_location");

                                var seat = check_in_row(rowSeats, actual_location);

                                Color buttonColor = Colors.black;
                                String seat_name = "";
                                String seat_row = "";
                                String seat_col = "";

                                if (seat != "") {
                             //     print("for column $rowIndex");
                                  List<String> parts = seat.split("#");

                                  if (parts.length == 2) {
                                    seat_name = parts[0];
                                    String seat_location = parts[1];

                                    List<String> seat_coordinates =
                                        seat_location.split("x");

                                    if (seat_coordinates.length == 2) {
                                      seat_row = seat_coordinates[0];
                                      seat_col = seat_coordinates[1];

/*                                      // Now you can use seat_name, seat_row, and seat_col as needed
                                      print('Seat Name: $seat_name');
                                      print('Seat Row: $seat_row');
                                      print('Seat Column: $seat_col');*/
                                    } else {
                                      print(
                                          'Invalid seat location format: $seat_location');
                                    }
                                  } else {
                                    print('Invalid seat format: $seat');
                                  }

                                  switch (Selected_Items[seat_name]) {
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
                                            print('$seat changed');
                                            print(
                                                '$seat state = ${Selected_Items[seat_name]}');
                                            setState(() {
                                              Selected_Items[seat_name] =
                                                  Selected_Items[seat_name] == 0
                                                      ? 1
                                                      : 0;
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
                            padding: EdgeInsets.only(top:30.v),
                            child: Text("wiii sal3a"),
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
      String seat_location = parts[1];
      if (seat_location == location) {
       // print("actual location will be printed");
        return seat;
      }
    }

    return "";
  }

  fetch_row(int row_index){
    print("fetcch row for index=$row_index");
    var returned=["a#b"];


    for(var map in mappedSeatMatrix ){
      print("map is $map");

      Iterable<String> key = map.keys;
        var original_key = key.first;
        if(original_key==row_index.toString()){
          print("key is $original_key and map =${map[original_key]}");
          returned = map[original_key]!;
        }

    }
    print('rani hna bi =$row_index');
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

  /// Section Widget
  Widget _buildCheckoutButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {

        Navigator.pushNamed(context, AppRoutes.paymentSuccessScreen);
      },
      text: "Checkout",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 28.v,
      ),
    );
  }
}
