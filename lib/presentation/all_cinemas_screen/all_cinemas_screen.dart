import 'package:cinema_ticket_booking_app/core/utils/Cinema/cinema.dart';
import 'package:cinema_ticket_booking_app/databases/DBCinemas.dart';

import '../all_cinemas_screen/widgets/locationdetails_item_widget.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

import '../cinema_description_screen/cinema_description_screen.dart';
import 'model/cinema_model.dart';


class AllCinemasScreen extends StatefulWidget {
  const AllCinemasScreen({key});

  @override
  State<AllCinemasScreen> createState() => _AllCinemasScreenState();
}

class _AllCinemasScreenState extends State<AllCinemasScreen> {





/*  void updateList(String value) {
    setState(() {
      display_list =["hello","workd"];
          .where((element) =>
          element.cinema_name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }*/

  @override
  Widget build(BuildContext context) {
    Future<List<Map>> main_cinema_list = getCinemas();
    return  SafeArea(
        child:   Scaffold(
          appBar: _buildWelcomeBackGroup(context),

          body:  Padding(padding: const EdgeInsets.all(16),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text("Search for a Cinema",
                  style: TextStyle(color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,),

                ),
                const SizedBox(height: 20.0,),
                TextField(
               //   onChanged: (value) => updateList(value),
                  style:const TextStyle(color: const Color.fromARGB(255, 40, 39, 39),
                    fontSize: 14,),
                  decoration:InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff6F7277),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),

                    hintText: "Search For A Cinema",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 40, 39, 39),fontSize: 14),

                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: const Color.fromARGB(255, 40, 39, 39),
                  ) ,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: SizedBox(
                          height: 40,
                          width: 80,
                          child: ElevatedButton(
                              onPressed: () async {
                                await service_sync_cinemas();
                                setState(() {});
                              },

                              child: Text("Refresh Categories")),
                        )),
                  ],
                ),
                Expanded(

                  child:
                      FutureBuilder(future: main_cinema_list, builder: _build_list_cinemas)



                ),],

            ),

          ),
          bottomNavigationBar: _buildBottomBar(context), )
    );
  }
  Future<List<Map>> getCinemas() async {
    Future<List<Map>> locals =  DBCinemas.getAllCinemas();
    print("getCinemas()");
    return locals;
  }
  Widget _build_list_cinemas(BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.hasData) {
      print("snapshot.hasData");
      List<Map> display_list = snapshot.data as List<Map>;
      return ListView.builder(
        itemCount: display_list.length,
        itemBuilder: (context, index) {
          var cinema_name = display_list[index]["Cinema_name"];
          var cinema_location = display_list[index]["Cinema_location"];
          var cinema_closing = display_list[index]["Cinema_closing"];
          var cinema_desc =  display_list[index]["Cinema_description"];
          var cinema_img = display_list[index]["Cinema_image"];

          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            // Adjust the value as needed
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cinema_location,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 140, 255),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    cinema_name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                "Closed at $cinema_closing",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.cinemaDescriptionScreen,
                    arguments: {'id': index, 'cinema_name': cinema_name, 'cinema_description' : cinema_desc, 'cinema_location' : cinema_location ,
                    'cinema_image' : cinema_img, 'cinema_closing' : cinema_closing},
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset("assets/images/png/cinemas.png") ??
                      Container(
                        color: Colors.grey,
                        width: 500.0, // Adjust the width as needed
                        height: 50.0, // Adjust the height as needed
                      ),
                ),
              ),
            ),
          );
        },
      );


  } else if(snapshot.hasError){
      print("44444444444444444444444444444");
      return Text("${snapshot.hasError}");
    }
    return CircularProgressIndicator();
  }
  PreferredSizeWidget _buildWelcomeBackGroup(BuildContext context) {
    return CustomAppBar(
      leading: Text(""),
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
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
      index : 2,
    );
  }
}
