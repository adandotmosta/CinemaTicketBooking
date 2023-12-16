import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';





class CinemaDescriptionScreen2 extends StatelessWidget {
  const CinemaDescriptionScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var receivedArguments = ModalRoute.of(context)!.settings.arguments;
    var cinema_id;
    var cinema_name ;
    var cinema_description;
    var cinema_location;
    var cinema_image;
    var cinema_closing;

    // Check if receivedArguments is a Map and contains the 'index' key
    if(receivedArguments is Map){
      cinema_id = receivedArguments['id'];
      cinema_name= receivedArguments["cinema_name"];
      cinema_location = receivedArguments["cinema_location"];
      cinema_description =  receivedArguments["cinema_description"];
      cinema_closing  = receivedArguments["cinema_closing"];
      cinema_image = receivedArguments["cinema_image"];
    }


    return SafeArea(

        child: Scaffold(
          appBar: _buildAppBar2(context),
     //     backgroundColor: const Color(0xFF1A2232),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.v),

                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        cinema_name,
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
                    SizedBox(height: 20.v,),
                    Container(
                      width: 251.adaptSize,
                      height: 268.adaptSize,

                      clipBehavior: Clip.antiAlias,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
                      ),
                      child:  Image.asset(
                        "assets/images/TMV.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 10.v),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.only(
                              left: 26.h,
                            ),
                            leading: Container(
                              height: 40.v,
                              width: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffEB5757),
                              ),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: 30.adaptSize,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cinema_location,
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
                            contentPadding: EdgeInsets.only( left : 26.h),
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
                      SizedBox(height: 50.v),
                      Padding(
                        padding: EdgeInsets.only(left : 30.h),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Wrap(
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                      cinema_description,
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
                  height: 57.v,
                  width:315.h,
                  margin: EdgeInsets.all(40.adaptSize),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.sessionpercinemaScreen, arguments: { 'id' : cinema_id});
                    },
                    style:ElevatedButton.styleFrom(primary:Color(0xff54A8E5), shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),),
                    child: Center(
                      child: Text('Available Movies', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,

                      ),
                      ),
                    ),
                  ),
                ),
              ],
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

      centerTitle: true,
      title: AppbarTitle(
        text: "Details Cinema",
      ),
    );
  }

  PreferredSizeWidget _buildAppBar2(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      centerTitle: true,
      title: AppbarTitle(
        text: "Details Cinema",
      ),
    );
  }
}
