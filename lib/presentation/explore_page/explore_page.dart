import '../explore_page/widgets/topmoviessection_item_widget.dart';
import 'package:abdenour_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key})
      : super(
          key: key,
        );

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage>
    with AutomaticKeepAliveClientMixin<ExplorePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 31.v),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 30.h),
                          child: _buildSectionTitle(
                            context,
                            sectionTitle: "Top Movies",
                            btnSeeAllText: "See more",
                          ),
                        ),
                        SizedBox(height: 10.v),
                        _buildTopMoviesSection(context),
                        SizedBox(height: 29.v),
                        Padding(
                          padding: EdgeInsets.only(right: 30.h),
                          child: _buildSectionTitle(
                            context,
                            sectionTitle: "Recommended",
                            btnSeeAllText: "See more",
                          ),
                        ),
                        SizedBox(height: 12.v),
                        _buildEscapeRoomTwoSection(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopMoviesSection(BuildContext context) {
    return SizedBox(
      height: 306.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 30.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return TopmoviessectionItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildEscapeRoomTwoSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle432190x120,
                        height: 190.v,
                        width: 120.h,
                        radius: BorderRadius.circular(
                          12.h,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle4325,
                        height: 190.v,
                        width: 120.h,
                        radius: BorderRadius.circular(
                          12.h,
                        ),
                        margin: EdgeInsets.only(left: 160.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 3.v),
            Text(
              "Escape Room 2",
              style: CustomTextStyles.titleMediumBold,
            ),
            SizedBox(height: 2.v),
            Text(
              "Thriller",
              style: CustomTextStyles.bodyMediumPoppinsGray400,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle4326,
              height: 190.v,
              width: 120.h,
              radius: BorderRadius.circular(
                12.h,
              ),
            ),
            SizedBox(height: 3.v),
            Text(
              "Don’t Breathe 2",
              style: CustomTextStyles.titleMediumBold,
            ),
            SizedBox(height: 2.v),
            Text(
              "Drama",
              style: CustomTextStyles.bodyMediumPoppinsGray400,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 193.v),
            Text(
              "Tokyo Revengers",
              style: CustomTextStyles.titleMediumBold,
            ),
            SizedBox(height: 2.v),
            Text(
              "Action",
              style: CustomTextStyles.bodyMediumPoppinsGray400,
            ),
          ],
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildSectionTitle(
    BuildContext context, {
    required String sectionTitle,
    required String btnSeeAllText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: CustomTextStyles.titleLarge_1.copyWith(
            color: appTheme.whiteA70001,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 3.v,
            bottom: 5.v,
          ),
          child: Text(
            btnSeeAllText,
            style: CustomTextStyles.bodyMediumPoppinsGray60002.copyWith(
              color: appTheme.gray60002,
            ),
          ),
        ),
      ],
    );
  }
}
