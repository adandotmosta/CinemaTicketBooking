
import 'dart:convert';

import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:cinema_ticket_booking_app/core/utils/api_endpoints.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_ticket_booking_app/core/constants/constants.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String responseMessage = "";

  Future<void> login(BuildContext context) async {

    var url = Endpoints.login;

    var response = await http.post(Uri.parse(url), body: {
      "email": EmailController.text,
      "password": passwordController.text,
    });
    var data = json.decode(response.body);
    setState(() {
      responseMessage = data["message"];
    });

    if (data['success']) {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(
        context,
        AppRoutes.homeScreen,
      );
    }
  }

    @override
    Widget build(BuildContext context) {
      mediaQueryData = MediaQuery.of(context);

      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              //height: double.maxFinite,
              child: SingleChildScrollView(
                //     physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 16.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle5,
                      height: 290.v,
                      width: 327.h,
                      radius: BorderRadius.circular(
                        12.h,
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Text(
                      "Hi there!",
                      style: CustomTextStyles.titleLargeMedium21,
                    ),
                    Text(
                      "Let’s Get Started",
                      style: theme.textTheme.headlineMedium,
                    ),
                    SizedBox(height: 19.v),
                    _buildThree(context),

                  ],
                ),
              ),
            ),
          ),
        ),

      );
    }

    /// Section Widget
    Widget _buildUsername(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 36.h,
          right: 15.h,
        ),
        child: CustomTextFormField(
          controller: EmailController,
          hintText: "Enter your email address",
          hintStyle: CustomTextStyles.bodySmallGray90003,
          alignment: Alignment.centerRight,
          prefix: Container(
            margin: EdgeInsets.only(
              left: 2.h,
              right: 8.h,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgUser,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 31.v,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.v),
          borderDecoration: TextFormFieldStyleHelper.underLineBlueGray,
        ),
      );
    }

    /// Section Widget
    Widget _buildPassword(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 36.h,
          right: 15.h,
        ),
        child: CustomTextFormField(
          controller: passwordController,
          hintText: "Password must contain 8 letters at least",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          hintStyle: CustomTextStyles.bodySmallGray90003,
          alignment: Alignment.centerRight,
          prefix: Container(
            margin: EdgeInsets.only(
              left: 5.h,
              right: 8.h,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgLock,
              height: 19.v,
              width: 17.h,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 34.v,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.only(
            top: 6.v,
            right: 30.h,
            bottom: 6.v,
          ),
          borderDecoration: TextFormFieldStyleHelper.underLineBlueGray,
        ),
      );
    }

    /// Section Widget
  Widget _buildLogin(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        await login(context);
      },
      height: 48.v,
      text: "Login",
      margin: EdgeInsets.symmetric(horizontal: 48.h),
      buttonStyle: CustomButtonStyles.outlineBlack,
      buttonTextStyle: CustomTextStyles.titleLargeGray100,
      alignment: Alignment.center,
    );
  }



  /// Section Widget
    Widget _buildCreateAccount(BuildContext context) {
      return CustomElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context,
            AppRoutes.signUpScreen,);
        },
        height: 48.v,
        text: "Create account",
        margin: EdgeInsets.symmetric(horizontal: 48.h),
        buttonStyle: CustomButtonStyles.outlineBlackTL12,
        buttonTextStyle: CustomTextStyles.titleLargeGray100,
        alignment: Alignment.center,
      );
    }

  /// Section Widget
  Widget _buildThree(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.v),
        decoration: AppDecoration.fillBlueE.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL43,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 26.v),
            Center(
              child: Text(
                responseMessage,
                style: TextStyle(
                  color: responseMessage.contains("successful") ? Colors.green : Colors.red,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 18.v),
            Padding(
              padding: EdgeInsets.only(left: 36.h),
              child: Text(
                "Email",
                style: CustomTextStyles.titleMediumGray50,
              ),
            ),
            SizedBox(height: 2.v),
            _buildUsername(context),
            SizedBox(height: 18.v),
            Padding(
              padding: EdgeInsets.only(left: 36.h),
              child: Text(
                "Password",
                style: CustomTextStyles.titleMediumGray50,
              ),
            ),
            _buildPassword(context),
            SizedBox(height: 11.v),
            _buildLogin(context),
            SizedBox(height: 10.v),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 18.v,
                      bottom: 13.v,
                    ),
                    child: SizedBox(
                      width: 165.h,
                      child: Divider(
                        color: appTheme.black900.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Text(
                    "or",
                    style: CustomTextStyles.titleLargeLailaIndigo900,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 18.v,
                      bottom: 13.v,
                    ),
                    child: SizedBox(
                      width: 165.h,
                      child: Divider(
                        color: appTheme.black900.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11.v),
            _buildCreateAccount(context),
          ],
        ),
      ),
    );
  }
}
