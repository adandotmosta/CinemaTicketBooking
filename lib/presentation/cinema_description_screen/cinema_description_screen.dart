import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}



class CinemaDescriptionScreen2 extends StatelessWidget {
  const CinemaDescriptionScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = screenWidth(context);
    return SafeArea(

        child: Scaffold(
          appBar: _buildAppBar2(context),
          backgroundColor: const Color(0xFF1A2232),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "TMV Cinema",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      height: 250,

                      clipBehavior: Clip.antiAlias,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
                      ),
                      child:  Image.asset(
                        "assets/images/TMV.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.15,vertical: 10),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffEB5757),
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Garden City, Cheraga, Algiers",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffEB5757),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3 rooms with a capacity of 600 people",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      SizedBox(width: 20),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Wrap(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "TMV garden city is a big cinema located on a big Cente cinema  which is Garden City, Cheraga, Algiers. It Contains 3 Rooms With ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff696D74),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 60,
                  width:320,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.sessionpercinemaScreen);
                    },
                    style:ElevatedButton.styleFrom(primary:Color(0xff54A8E5), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),),
                    child: Center(
                      child: Text('Available Movies', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,

                      ),),
                    ),
                  ),
                ),  ],
            ),
          ),
          /* floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 60,
          width:320,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {},
            style:ElevatedButton.styleFrom(primary:Color(0xff54A8E5), shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),),
            child: Center(
              child: Text('Available Movies', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,

                      ),),
            ),
          ),
        ),*/
          //  bottomNavigationBar: _buildAvailableMovies(context)),
        ));
  }
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      leading: GestureDetector(
        onTap: () {
          print("GestureDetector tapped!"); // Debug print
          Navigator.pop(context);
        },
        child: AppbarLeadingImage(
          imagePath: ImageConstant.imgBtnBack,
          margin: EdgeInsets.only(
            left: 30.h,
            top: 15.v,
            bottom: 14.v,
          ),
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Details Cinema",
      ),
    );
  }

  PreferredSizeWidget _buildAppBar2(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios ,color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "Details Cinema",
      ),
    );
  }
}
