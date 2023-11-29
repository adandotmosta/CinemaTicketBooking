import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.allCinemasScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.sessionpercinemaScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.cinemaDescriptionScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.exploreTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.detailsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.selectSeatsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.checkoutScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentSuccessScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.eTicketScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.downloadETicketScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.movieSessionsTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.savedPlanScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          userName: "",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.settingsScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String userName,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
