
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_icon_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/api_endpoints.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController personalDataController = TextEditingController();

  TextEditingController notificationController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 18.v,
          ),
          child: Column(
            children: [
           //   _buildProfileSection(context),
              SizedBox(height: 34.v),
              Divider(
                color: appTheme.whiteA70001.withOpacity(0.3),
              ),
              SizedBox(height: 18.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 11.v),
              // Personal data
              _buildPersonalData(context,"Personal Data","assets/images/img_activity.png",Colors.indigo),
              SizedBox(height: 22.v),
              _buildPersonalData(context,"Email & Payement", "assets/images/png/img_add_user.png",Color(0xFF54C2E5)),
              SizedBox(height: 22.v),

              SizedBox(height: 34.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Divider(
                  color: appTheme.whiteA70001.withOpacity(0.3),
                  endIndent: 10.h,
                ),
              ),
              SizedBox(height: 19.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Privacy & Policy",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 10.v),
              _buildPersonalData(context, "Notifications","assets/images/png/img_notification.png", Colors.indigo),
              SizedBox(height: 22.v),
              _buildPersonalData(context,"Your Ticket", "assets/images/png/img_ticket_white_a700_01.png",Color(0xFF54C2E5)),
              SizedBox(height: 22.v),
              _buildPersonalData(context,"Logout", "assets/images/png/img_logout.png",Color(0xFFE55454)),
              SizedBox(height: 6.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }


  Widget _buildPersonalData(BuildContext context,String title,leading_icon,color ){
    return   GestureDetector(
      onTap: (){
        if(title=="Personal Data") {
          Navigator.pushNamed(
              context, AppRoutes.account);
        } else if(title=="Logout"){
          Navigator.pushNamed(
              context, AppRoutes.loginScreen);
        } else if(title=="Your Ticket"){
          Navigator.pushNamed(
              context, AppRoutes.eTicketScreen);
        }
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.h,
              ),
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              /*          child: CustomImageView(
                imagePath: ImageConstant.imgActivity,
                width: 24.v,
                height: 24.v,
              ),*/
              child : Image.asset(
                leading_icon,
                height: 24.v,
                width: 24.v,
              ),
            ),
          ),
          Container(
            //  alignment: Alignment.topLeft*,
           margin: EdgeInsets.only(left: 12.v,),

            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.adaptSize,
              ),
              textAlign: TextAlign.left,


            ),
          ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.h,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(

                          child: CustomImageView(
                            imagePath: ImageConstant.imgBtnBackWhiteA70001,
                            width: 24.v,
                            height: 24.v,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


        ],
      ),
    );
  }

  Future<bool> logout(BuildContext context) async {
    try {
      var url = Endpoints.logout;

      // Get the CSRF token from the cookie
      var csrfToken = 'your_csrf_token_value';  // Replace with the actual CSRF token
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-CSRFToken': csrfToken,
      };

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        // Add any additional parameters needed for logout
      );

      // Check the response status
        // Logout successful
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.loginScreen,
              (route) => false,
        );
        return true; // Logout successful

    } catch (error) {
      // Handle unexpected errors during logout
      print('Error during logout: $error');
      return false; // Logout failed
    }
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 50.h,
      leading: Text(""),

      centerTitle: true,
      title: AppbarTitle(
        text: "Settings",
      ),
    );
  }

  /// Section Widget
  Widget _buildProfileSection(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgProfile,
          height: 48.adaptSize,
          width: 48.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Miles Morales",
                style: CustomTextStyles.titleMedium18,
              ),
              Text(
                "Film Hunter",
                style: CustomTextStyles.titleSmallGray400,
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgBtnBackWhiteA70001,
          height: 26.adaptSize,
          width: 26.adaptSize,
          margin: EdgeInsets.only(right: 10.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
      index: 3,
    );
  }

}
