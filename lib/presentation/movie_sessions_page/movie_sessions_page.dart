import '../movie_sessions_page/widgets/sessionlist_item_widget.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MovieSessionsPage extends StatefulWidget {
  const MovieSessionsPage({Key? key})
      : super(
    key: key,
  );

  @override
  MovieSessionsPageState createState() => MovieSessionsPageState();
}

class MovieSessionsPageState extends State<MovieSessionsPage>
    with AutomaticKeepAliveClientMixin<MovieSessionsPage> {
  bool isSelectedSwitch = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
    //    backgroundColor: appTheme.gray90001,
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    _buildControls(context),
                    SizedBox(
                      height: 590.v,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: double.maxFinite,
                              margin: EdgeInsets.only(bottom: 10.v),
                              padding: EdgeInsets.symmetric(
                                horizontal: 38.h,
                                vertical: 7.v,
                              ),
                              decoration: AppDecoration.fillOnPrimaryContainer,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 550.v),
                                    child: Text(
                                      "Time",
                                      style: CustomTextStyles.labelLargePTRootUIBluegray200,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 47,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 550.v),
                                    child: Text(
                                      "Adult",
                                      style: CustomTextStyles.labelLargePTRootUIBluegray200,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 25,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 550.v),
                                    child: Text(
                                      "Child",
                                      style: CustomTextStyles.labelLargePTRootUIBluegray200,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 26,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 550.v),
                                    child: Text(
                                      "Student",
                                      style: CustomTextStyles.labelLargePTRootUIBluegray200,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.h,
                                      right: 18.h,
                                      bottom: 550.v,
                                    ),
                                    child: Text(
                                      "VIP",
                                      style: CustomTextStyles.labelLargePTRootUIBluegray200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _buildSessionList(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildControls(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 9.h,
              top: 3.v,
            ),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgNavApril18,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                SizedBox(height: 2.v),
                Text(
                  "April, 18",
                  style: CustomTextStyles.titleSmallWhiteA70001Bold,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 53,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgNavTime,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
                Text(
                  "Time ↑",
                  style: CustomTextStyles.titleSmallWhiteA70001Bold,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 46,
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              children: [
                CustomSwitch(
                  value: isSelectedSwitch,
                  onChange: (value) {
                    setState(() {
                      isSelectedSwitch = value;
                    });
                  },
                ),
                SizedBox(height: 2.v),
                Text(
                  "By cinema",
                  style: CustomTextStyles.titleSmallWhiteA70001Bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSessionList(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 30.v),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return SessionlistItemWidget();
          },
        ),
      ),
    );
  }
}
