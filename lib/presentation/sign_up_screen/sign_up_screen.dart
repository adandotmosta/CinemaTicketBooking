
import 'dart:convert';
import 'dart:ffi';

import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_checkbox_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_ticket_booking_app/core/constants/constants.dart';
import 'package:cinema_ticket_booking_app/core/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(

    key: key,
  );

  TextEditingController usernameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController confirmPasswordFieldController = TextEditingController();


  Future<bool> register() async {
    try {
      var url = Endpoints.signup;


      var response = await http.post(Uri.parse(url), body: {
        "username": usernameFieldController.text,
        "email": emailFieldController.text,
        "password": passwordFieldController.text,
        "phone": phoneNumberFieldController.text
      });

      var data = json.decode(response.body);
      if (data['success']) {
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return true; // Registration successful
      } else {
        // Registration failed
        Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return false; // Registration failed
      }
    } catch (error) {
      // Handle any unexpected errors during registration
      print("Unexpected error during registration: $error");
      return false; // Registration failed
    }
  }
  
  bool agreeCheckbox = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);



    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(

              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 41.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign up",
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(height: 40.v),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "Username",
                      style: CustomTextStyles.titleMediumGray50,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  _buildUsernameField(context),
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "Email",
                      style: CustomTextStyles.titleMediumGray50,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildEmailField(context),
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "Phone number",
                      style: CustomTextStyles.titleMediumGray50,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildPhoneNumberField(context),
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "Password",
                      style: CustomTextStyles.titleMediumGray50,
                    ),
                  ),
                  SizedBox(height: 6.v),
                  _buildPasswordField(context),
                  SizedBox(height: 28.v),
                  Padding(
                    padding: EdgeInsets.only(left: 11.h),
                    child: Text(
                      "Confirm Password",
                      style: CustomTextStyles.titleMediumGray50,
                    ),
                  ),
                  SizedBox(height: 6.v),
                  _buildConfirmPasswordField(context),
                  SizedBox(height: 37.v),
                  _AgreeCheckbox(key : UniqueKey()),
                  SizedBox(height: 5.v),
                  _buildCreateAccountStack(context),
                  SizedBox(height: 11.v),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context,
                              AppRoutes.loginScreen, );


                      },
                      child: Text(
                        "I’m already a member",
                        style: CustomTextStyles.labelLargeWhiteA70001,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.v),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 145.h,
                      child: Divider(
                        color: appTheme.whiteA70001,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUsernameField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(
 
        controller: usernameFieldController,
  
      decoration: InputDecoration(
          hintText: "enter your username",
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

  Widget _buildEmailField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(

        controller: emailFieldController,
        decoration: InputDecoration(
            hintText: "example@gmail.com",
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
  Widget _buildPhoneNumberField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(
 
        controller: phoneNumberFieldController,
  
        decoration: InputDecoration(
            hintText: "enter your phone number",
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
  Widget _buildConfirmPasswordField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child : TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "characters must be as same as your password",
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
  Widget _buildPasswordField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child: TextField(
 
        controller: passwordFieldController,
  
        decoration: InputDecoration(
          hintText: "password must contains at least 8 characters",
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

  
        textInputAction: TextInputAction.done,
        obscureText: true,
      ),
    );
  }

  /// Section Widget




  /// Section Widget
  _buildCreateAccount(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        try {
          bool success = await register();

          if (success) {
            // Registration successful, navigate to login screen
            print("Navigating to login screen");
            Navigator.pushNamed(context, AppRoutes.loginScreen);
          } else {
            // Registration failed
            print("Registration failed");
          }
        } catch (error) {
          // Handle any unexpected errors during registration
          print("Unexpected error during registration: $error");
        }
      },
      width: MediaQuery.of(context).size.width * 0.8,
      text: "Create account",
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700Bold,
      alignment: Alignment.center,
    );
  }


  /// Section Widget
  Widget _buildCreateAccountStack(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 57.v,
        width: 315.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 95.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 29.h,
                  vertical: 3.v,
                ),
                decoration: AppDecoration.fillBlue.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.v),
                      Text(
                        "Sign up",
                        style: CustomTextStyles.titleMediumSemiBold,
                      ),
                    ],
                  ),
              ),
            ),
            _buildCreateAccount(context),
          ],
        ),
      ),
    );
  }


  /// Common widget
}
class _AgreeCheckbox extends StatefulWidget {
  const _AgreeCheckbox({Key? key})
      : super(
    key: key,
  );
  @override
  State<_AgreeCheckbox> createState() => _AgreeCheckboxState();
}

class _AgreeCheckboxState extends State<_AgreeCheckbox> {
  bool value = true;

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        title: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'Agree on ',
                style: TextStyle(color: Colors.white, fontSize: 10), // White color
              ),
              TextSpan(
                text: 'terms & conditions',
                style: TextStyle(color: Colors.blue, fontSize: 10), // Blue color
              ),
            ],
          ),
        ),

        onChanged: (new_val) {
          value = new_val!;
          setState(() {

          });
        }
      ),
    );
  }
}

