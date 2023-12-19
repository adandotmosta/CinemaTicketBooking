
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/all_cinemas_screen/all_cinemas_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/cinema_description_screen/cinema_description_screen.dart';
import 'package:cinema_ticket_booking_app/presentation/details_page/details_page.dart';
import 'package:cinema_ticket_booking_app/presentation/home_screen/model2/cinema_model.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_subtitle.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
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
    final mediaQueryData = MediaQuery.of(context);

    return
      SafeArea(
          child: Scaffold(
            appBar: _buildWelcomeBackGroup(context),

            body:
            SingleChildScrollView(child:
            Padding(padding: const EdgeInsets.all(0),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:20),
                    Column(
                        children:[
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,

                              child: TextField(
                                //onChanged: (value) => updateList(value),

                                style:const TextStyle(color: Color.fromARGB(255, 45, 44, 44),
                                  fontSize: 14,
                                ),
                                decoration:InputDecoration(

                                  filled: true,
                                  fillColor: const Color(0xff6F7277),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "Search your favourite movie ",
                                  prefixIcon: const Icon(Icons.search),
                                  prefixIconColor: Color.fromARGB(255, 45, 44, 44),

                                ), ) )
                          ,
                          const SizedBox(height: 20.0,),
                          Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[


                                Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child:
                                  Text("Coming Soon",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),),

                                SizedBox(

                                  height: 280,
                                  child: Container(

                                      child:  Expanded(  // Set the height of the container
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            _buildItem(context,'Resident Evil - Racoon City', 'November 2024', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6tcJWhWx_qhPOH4Kb-0m-4RRZuSFkKhd3EeMJ6CNqyE5TcrGyOuPXmtEq5lu89XYWkdc&usqp=CAU'),
                                            _buildItem(context,'Spiderman No Way Home', 'December 2024', 'https://www.usatoday.com/gcdn/presto/2018/09/18/USAT/3ae04a72-eb70-4c1e-9025-912df0633302-Spider-Man_PS4.jpg?width=1200&disable=upscale&format=pjpg&auto=webp'),
                                            _buildItem(context,'Image 3', 'Description 3', 'https://media.licdn.com/dms/image/D4E0BAQFAR9M8HoD8NQ/company-logo_200_200/0/1695818527430/tmv_cinemas_logo?e=2147483647&v=beta&t=UH_0Le2kwwnzV9XzbyVKy2h5is7aMCIH3A39yvCcskI'),

                                          ],

                                        ),)
                                  ),
                                ),])]),


                    Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Cinemas",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder:(context) => AllCinemasScreen()));

                              },
                              child:
                              Text("SEE ALL" ,style: TextStyle(fontSize: 16,color: Colors.grey),))
                        ],
                      ),


                    ),
                    SizedBox(
                        height: 225,
                        child: Expanded(child:
                        const SearchPage(),)
                    ),







                  ],
                )

            ),
            ),
            bottomNavigationBar: _buildBottomBar(context),  ));
  }

  /// Section Widget
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
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context,
              AppRoutes.settingsScreen, );
          },
          child: AppbarTrailingImage(
            imagePath: ImageConstant.imgProfile,
            margin: EdgeInsets.symmetric(
              horizontal: 30.h,
              vertical: 4.v,
            ),
          ),
        ),
      ],
    );
  }







  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
Widget _buildItem(BuildContext context,String title, String description, String imagePath) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(

      width: MediaQuery.of(context).size.width * 0.80,
      decoration:const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,        children: [
        GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,
                AppRoutes.movieSessionsTabContainerScreen,);
            },
            child:
            Container(
              height: 180,


              child:ClipRRect(
                borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 180,
                ),
              ),
            ))
        ,
        const  SizedBox(height:5),

        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 0.0),
            child:  Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 2.0),
            child: Text(
              description,
              style: const TextStyle(
                color: Color(0xFFB2B5BB),
                fontSize: 15,
              ),
            ),
          ),
        ),
        //const SizedBox(height: 10,),



      ],
      ),
    ),
  );

}


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<CineamaModel> main_cinema_list = [
    CineamaModel("Cosmos Alpha", 10, "Alger"),

    CineamaModel("CineGold", 10, "Senia Mall, Es Senia, Oran"),
    CineamaModel("CineGold", 10, "Senia Mall, Es Senia, Oran"),
  ];

  static List<CineamaModel> display_list = List.from(main_cinema_list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: display_list.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            display_list[index].cinema_location ?? '',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 140, 255),
                              fontSize: 14,
                            ),
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
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const CinemaDescriptionScreen2(),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/png/img_cosmosalpha_1.png',

                            fit: BoxFit.cover,
                            width: 70,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
