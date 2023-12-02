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

  static List<CineamaModel> main_cinema_list =[
    CineamaModel("TMV Cinema",10,"Garden City, Cheraga, Alger",        Image.network("https://media.licdn.com/dms/image/D4E0BAQFAR9M8HoD8NQ/company-logo_200_200/0/1695818527430/tmv_cinemas_logo?e=2147483647&v=beta&t=UH_0Le2kwwnzV9XzbyVKy2h5is7aMCIH3A39yvCcskI"),),

    CineamaModel("CineGold",10,"Senia Mall, Es Senia, Oran",      Image.network("https://media.licdn.com/dms/image/D4E0BAQFAR9M8HoD8NQ/company-logo_200_200/0/1695818527430/tmv_cinemas_logo?e=2147483647&v=beta&t=UH_0Le2kwwnzV9XzbyVKy2h5is7aMCIH3A39yvCcskI"),),

    CineamaModel("Cosmos Alpha",10,"Garden City, Cheraga, Alger",      Image.network("https://media.licdn.com/dms/image/D4E0BAQFAR9M8HoD8NQ/company-logo_200_200/0/1695818527430/tmv_cinemas_logo?e=2147483647&v=beta&t=UH_0Le2kwwnzV9XzbyVKy2h5is7aMCIH3A39yvCcskI"),),
    CineamaModel("IBN ZEYDOUN",10,"El Madania, Algeria",      Image.network("https://media.licdn.com/dms/image/D4E0BAQFAR9M8HoD8NQ/company-logo_200_200/0/1695818527430/tmv_cinemas_logo?e=2147483647&v=beta&t=UH_0Le2kwwnzV9XzbyVKy2h5is7aMCIH3A39yvCcskI"),),

    CineamaModel("Viva Cinema",10,"Center of algiers",      Image.network("https://media.licdn.com/dms/image/D4E0BAQFAR9M8HoD8NQ/company-logo_200_200/0/1695818527430/tmv_cinemas_logo?e=2147483647&v=beta&t=UH_0Le2kwwnzV9XzbyVKy2h5is7aMCIH3A39yvCcskI"),),








  ];

  static List<CineamaModel> display_list= List.from(main_cinema_list);

  void updateList(String value) {
    setState(() {
      display_list = main_cinema_list
          .where((element) =>
          element.cinema_name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (value) => updateList(value),
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
                Expanded(

                  child: display_list.isEmpty  ?const Center(child: Text("No result found",style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold,),)):

                  ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(bottom: 16.0), // Adjust the value as needed
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              display_list[index].cinema_location ?? '',
                              style: TextStyle(color: const Color.fromARGB(255, 0, 140, 255),fontSize: 12,),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              display_list[index].cinema_name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "Closed at ${display_list[index].cinema_close!} PM",
                          style: const TextStyle(color: Colors.grey,fontSize: 12),
                        ),
                        leading: GestureDetector(
                          onTap: () => {
                            Navigator.push(context,
                              MaterialPageRoute(builder:(context)=>const CinemaDescriptionScreen2() ),)
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: display_list[index].cinemaImage ?? Container(
                              color: Colors.grey,
                              width: 500.0, // Adjust the width as needed
                              height: 50.0, // Adjust the height as needed
                            ),
                          ),
                        ),



                      ),
                    ),
                  ),


                ),],

            ),

          ),
          bottomNavigationBar: _buildBottomBar(context), )
    );
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
