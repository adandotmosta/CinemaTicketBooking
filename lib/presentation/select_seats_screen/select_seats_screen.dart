import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

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
@override
  void initState() {
    // TODO: implement initState
    super.initState();

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
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgBtnBack,
        margin: EdgeInsets.only(
          left: 30.h,
          top: 15.v,
          bottom: 14.v,
        ),
      ),
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
      height: 380.v,
      width: 315.h,
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
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisSpacing: 20,
                shrinkWrap: true,
                crossAxisCount: 6,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
                children: List.generate(seats.length, (index) {
                  String seat = seats[index];

                  Color buttonColor;
                  switch (Selected_Items[seat]) {
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

                  return Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(30.adaptSize, 30.adaptSize),
                        backgroundColor: buttonColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        print(seat + " changed");
                        print(seat + " state = " + "${Selected_Items[seat]}");
                        setState((){
                          int? seat_state = Selected_Items[seat];
                          if(seat_state==0) {
                            Selected_Items[seat] =1;

                          } else if(seat_state==1) {
                            Selected_Items[seat] =0;
                          }
                        });
                      },
                      child: Text(
                        seat,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),


        ],
      ),
    );
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

  Widget _SetColor(BuildContext context){
    return Text("hello world");
  }
  /// Section Widget
  Widget _buildCheckoutButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Checkout",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 28.v,
      ),
    );
  }



}

