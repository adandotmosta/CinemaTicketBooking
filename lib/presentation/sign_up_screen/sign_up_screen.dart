import 'dart:ffi';

import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:abdenour_s_application1/widgets/custom_checkbox_button.dart';
import 'package:abdenour_s_application1/widgets/custom_elevated_button.dart';
import 'package:abdenour_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
                    child: Text(
                      "I’m already a member",
                      style: CustomTextStyles.labelLargeWhiteA70001,
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
        controller: confirmPasswordFieldController,
        textInputAction: TextInputAction.done,
        obscureText: true,
      ),
    );
  }

  /// Section Widget




  /// Section Widget
  Widget _buildCreateAccount(BuildContext context) {
    return CustomElevatedButton(
      width: MediaQuery.of(context).size.width*0.8,
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

