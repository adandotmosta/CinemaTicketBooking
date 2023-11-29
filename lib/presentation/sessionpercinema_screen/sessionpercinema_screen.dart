import '../sessionpercinema_screen/widgets/userprofile_item_widget.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SessionpercinemaScreen extends StatelessWidget {
  SessionpercinemaScreen({Key? key}) : super(key: key);

  List<List<String>>? Movies;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    Movies = [["EQUALIZER3","21:00","VF",ImageConstant.imgSession],["EQUALIZER3","18:00","VF",ImageConstant.imgSession],["EQUALIZER3","18:00","VF",ImageConstant.imgSession],["EQUALIZER3","18:00","VF",ImageConstant.imgSession],["EQUALIZER3","18:00","VF",ImageConstant.imgSession],["EQUALIZER3","18:00","VF",ImageConstant.imgSession],["The Nun2","20:00","VO",ImageConstant.imgSession2]];
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 21.v),
                child: Column(children: [
                  SizedBox(height: 154.v),
                  _buildUserProfile(context)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBtnBack,
            margin: EdgeInsets.only(left: 30.h, top: 15.v, bottom: 14.v)),
        centerTitle: true,
        title: AppbarTitle(text: "Sessions Available"));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: ListView.separated(
                physics : BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 1.v);
                },
                itemCount: Movies!.length,
                itemBuilder: (context, index) {
                  String? title = Movies?[index][0];
                  String? hour = Movies?[index][1];
                  String? lang = Movies?[index][2];
                  String? img = Movies?[index][3];
                  return UserprofileItemWidget(
                    movie_hour: hour,
                      movie_title: title,
                      movie_img: img,
                      movie_lang: lang,
                      onTapImgUserImage: () {
                    onTapImgUserImage(context);
                  });
                })));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the selectSeatsScreen when the action is triggered.
  onTapImgUserImage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.selectSeatsScreen);
  }
}
