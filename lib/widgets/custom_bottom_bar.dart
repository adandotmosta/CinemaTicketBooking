import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged,this.index});

  Function(BottomBarEnum)? onChanged;
  int? index;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index ?? 0;
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgPlay,
      activeIcon: ImageConstant.imgPlay,
      type: BottomBarEnum.Play,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCinemas,
      activeIcon: ImageConstant.imgCinemas,
      type: BottomBarEnum.Cinemas,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgProfileBlue400,
      activeIcon: ImageConstant.imgProfileBlue400,
      type: BottomBarEnum.Profileblue400,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: appTheme.blueGray600,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 24.adaptSize,
              width: 24.adaptSize,
              color: appTheme.blue400,
            ),
            label: 'Hello world',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);

          // Navigate to the corresponding screen
          switch (bottomMenuList[index].type) {
            case BottomBarEnum.Home:
              Navigator.of(context).pushNamed(AppRoutes.homeScreen);
              break;
            case BottomBarEnum.Play:
              Navigator.of(context).pushNamed(AppRoutes.explorePage);
              break;
            case BottomBarEnum.Cinemas:
            //  Navigator.of(context).pushNamed(AppRoutes.sessions_tab);
              Navigator.of(context).pushNamed(AppRoutes.sessionpercinemaScreen,arguments: {'id' :  1 });
              break;
            case BottomBarEnum.Profileblue400:
              Navigator.of(context).pushNamed(AppRoutes.settingsScreen);
              break;
          }

          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Play,
  Profileblue400,
  Cinemas,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
