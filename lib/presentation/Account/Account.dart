
import 'dart:convert';
import 'dart:io';

import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_drop_down.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import "package:cinema_ticket_booking_app/core/utils/edit_user_api.dart";

class Account extends StatelessWidget {
  Account({Key? key})
      : super(
    key: key,
  );

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList1 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList2 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList3 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList4 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList5 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList6 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList7 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  TextEditingController usernameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController confirmPasswordFieldController = TextEditingController();
  TextEditingController placer = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    mediaQueryData = MediaQuery.of(context);
    var id = 1;

    Future<dynamic> credentials = readCounter();




    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: FutureBuilder(
            future: credentials,
            builder: _buildcreds as dynamic,
          ),

        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }
  Future<String> get _localPath async{

    final directory = await getApplicationDocumentsDirectory();
    return directory.path;


  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/credentials.json' as String);
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
  Future<dynamic> readCounter() async {
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
   Widget _buildcreds(BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.hasData){
      Map? creds = snapshot.data;
      int user_id = creds?["id"];
      String username = creds?["username"];
      String password = creds?["password"];
      String email = creds?["email"];
      String phoneNumber = creds?["phonenumber"];


      return    Column(
        children: [
          SizedBox(height: 16.v),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 38.h),
                        child: Text(
                          "02 November 2024",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.v),
                    _buildMovie1(context,username  ),
                    SizedBox(height: 17.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    SizedBox(height: 8.v),

                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Username",
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildUsernameField(context , username),

                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "email",
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildEmailField(context ,email),
                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Password",
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildPasswordField(context, password ),

                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Text(
                        "Phone Number",
                        style: CustomTextStyles.titleMediumGray50,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildPhoneNumberField(context,phoneNumber ),

                    SizedBox(height: 20.v),
                    _buildCheckout(context, user_id ),

                    SizedBox(height: 18.v),


                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else{
      return CircularProgressIndicator();
    }
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
        text: "Account",
      ),
    );
  }
  /// Section Widget
  Widget _buildUsernameField(BuildContext context,username) {
    usernameFieldController.text = username;
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(

        controller: usernameFieldController,

        decoration: InputDecoration(
          //  hintText: username,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:  BorderSide(color : Colors.white),
            )
        ),
      ),
    );
  }

  Widget _buildEmailField(BuildContext context,email) {
    emailFieldController.text = email;

    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(

        controller: emailFieldController,
        decoration: InputDecoration(
      //      hintText: "Enter Your email please",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:  BorderSide(color : Colors.white),
            )
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberField(BuildContext context,phone) {
    phoneNumberFieldController.text = phone;
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(

        controller: phoneNumberFieldController,

        decoration: InputDecoration(
            hintText: phone,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:  BorderSide(color : Colors.white),
            )
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordField(BuildContext context,password) {
    passwordFieldController.text = password;
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(
        controller: passwordFieldController,
        obscureText: true,
        decoration: InputDecoration(
        //    hintText: password,
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            labelStyle: TextStyle(

              color: Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide:  BorderSide(color : Colors.white),
            )
        ),
      ),
    );
  }
  /// Section Widget
  Widget _buildMovie1(BuildContext context,username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle4327,
          height: 76.adaptSize,
          width: 76.adaptSize,
          radius: BorderRadius.circular(
            12.h,
          ),
        ),
        Container(
          height: 64.v,
          width: 121.h,
          margin: EdgeInsets.only(
            left: 12.h,
            top: 3.v,
            bottom: 8.v,
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Action",
                      style: CustomTextStyles.bodySmallBlue400,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      username,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "",
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgStar518x18,
          height: 18.adaptSize,
          width: 18.adaptSize,
          radius: BorderRadius.circular(
            1.h,
          ),
          margin: EdgeInsets.only(
            top: 30.v,
            bottom: 28.v,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 2.h,
            top: 29.v,
            bottom: 25.v,
          ),
          child: Text(
            "5,0",
            style: CustomTextStyles.bodyMediumPoppinsBluegray20002,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 148.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(7.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "02 Nov 2024",
              items: dropdownItemList1,
              onChanged: (value) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 147.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(29.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "01.00 PM",
              items: dropdownItemList2,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }



  /// Section Widget
  Widget _buildCheckout(BuildContext context, user_id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            onPressed: () async{
             await _handle_logic(user_id);
            },
            text: "Checkout",
            margin: EdgeInsets.only(bottom: 1.v),
          ),
        ),
        Container(
          height: 58.v,
          width: 64.h,
          margin: EdgeInsets.only(left: 20.h),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 12.v,
          ),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgDelete,
            height: 32.adaptSize,
            width: 32.adaptSize,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
  Future<bool> _handle_logic(user_id) async{
    String email = emailFieldController.text.toString();
    String password = passwordFieldController.text.toString();
    String username = usernameFieldController.text.toString();
    String phonenumber = phoneNumberFieldController.text.toString();

    await endpoint_api_edit_user(user_id=user_id, username=username, email=email, password=password,phonenumber=phonenumber);
    await writeCredentials(user_id, username, email, password, phonenumber);
    return true;






  }


  /// Section Widget
  Widget _buildDate1(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 148.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(7.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "02 Nov 2021",
              items: dropdownItemList5,
              onChanged: (value) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Time",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(height: 8.v),
            CustomDropDown(
              width: 147.h,
              icon: Container(
                margin: EdgeInsets.fromLTRB(27.h, 16.v, 25.h, 16.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                ),
              ),
              hintText: "01.00 PM",
              items: dropdownItemList6,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }

  /// Section Widget


  /// Section Widget


  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
      index: 3,
    );
  }


}
