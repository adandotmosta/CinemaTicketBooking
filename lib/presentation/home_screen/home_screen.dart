import '../home_screen/widgets/cinemalist_item_widget.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildWelcomeBackGroup(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 18.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: CustomSearchView(
                    controller: searchController,
                    hintText: "Search your favourite movie",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 31.v),
              Padding(
                padding: EdgeInsets.only(left: 30.h),
                child: Text(
                  "Coming Soon",
                  style: CustomTextStyles.titleLarge_1,
                ),
              ),
              SizedBox(height: 10.v),
              _buildMovieSection(context),
              SizedBox(height: 29.v),
              _buildCinemaSection(context),
              SizedBox(height: 12.v),
              _buildCinemaList(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildWelcomeBackGroup(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 30.h),
        child: Column(
          children: [
            AppbarSubtitleOne(
              text: "Welcome Back,",
              margin: EdgeInsets.only(right: 16.h),
            ),
            AppbarSubtitle(
              text: "Nadir Hamou",
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgProfile,
          margin: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 4.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildMovieSection(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 30.h),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgRectangle432180x315,
                      height: 180.v,
                      width: 315.h,
                      radius: BorderRadius.circular(
                        12.h,
                      ),
                    ),
                    SizedBox(height: 7.v),
                    Text(
                      "Resident Evil - Racoon City",
                      style: CustomTextStyles.titleLarge_1,
                    ),
                    Text(
                      "November 2024",
                      style: CustomTextStyles.titleSmallGray400Medium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180.v,
                        width: 315.h,
                        decoration: BoxDecoration(
                          color: appTheme.blueGray90001,
                          borderRadius: BorderRadius.circular(
                            12.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.v),
                      Text(
                        "Spiderman No Way Home",
                        style: CustomTextStyles.titleLarge_1,
                      ),
                      Text(
                        "Desember 2021",
                        style: CustomTextStyles.titleSmallGray400Medium,
                      ),
                    ],
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
  Widget _buildCinemaSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Cinemas",
              style: theme.textTheme.titleLarge,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 5.v,
                bottom: 3.v,
              ),
              child: Text(
                "See all",
                style: CustomTextStyles.bodyMediumPoppinsGray60002,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCinemaList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.h,
        right: 110.h,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 14.v,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return CinemalistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
