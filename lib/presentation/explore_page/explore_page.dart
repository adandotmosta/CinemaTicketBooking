
import 'package:cinema_ticket_booking_app/core/utils/API/class_api.dart';
import 'package:cinema_ticket_booking_app/core/utils/API/constants.dart';
import 'package:cinema_ticket_booking_app/core/utils/API/model/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinema_ticket_booking_app/presentation/categories_screen/categories.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../details_page/details_page.dart';
import '../explore_page/widgets/topmoviessection_item_widget.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:cinema_ticket_booking_app/core/utils/Movie/movie.dart';
import 'package:cinema_ticket_booking_app/databases/DBMovies.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  String selectedButton = 'Now Showing';
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> Comedy_movies;
  @override
  void initState(){
    super.initState();
    trendingMovies=Api().getTrendingMovies();
    Comedy_movies=Api().getComedyMovies();

  }

  Widget build(BuildContext context) {

    Future<List<Map>> movie_list = getAllmovies();
    return SafeArea(

        child:
        Scaffold(
          appBar: _buildAppBar2(context),
          //  backgroundColor: const Color(0xFF1A2232),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        //     color: const Color(0xFF32363D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = 'Now Showing';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                primary: selectedButton == 'Now Showing'
                                    ? Colors.blue
                                    : const Color(0xFF32363D),fixedSize: Size(120, 40),
                              ),
                              child:  Text( "Now Showing",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selectedButton == 'Now Showing'
                                      ? Colors.white
                                      : Colors.grey,
                                ),),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = 'Upcoming';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                primary: selectedButton == 'Upcoming'
                                    ? Colors.blue
                                    : const Color(0xFF32363D),fixedSize: Size(120, 40),
                              ),
                              child:  Text( "Upcoming",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selectedButton == 'Upcoming'
                                      ? Colors.white
                                      : Colors.grey,),
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Top Movies",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SeeAll",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 360,
                      child:   FutureBuilder(future: movie_list, builder: _build_list_movies)

                  ),
                  SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Recommended",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SeeAll",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(

                      height: MediaQuery.of(context).size.height * 0.42,
                      child:   FutureBuilder(future: trendingMovies, builder: _buildItem2)

                  ),
                  SizedBox(height: 20,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Comedy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "SeeAll",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(

                      height: MediaQuery.of(context).size.height * 0.42,
                      child:   FutureBuilder(future: Comedy_movies, builder: _buildItem2)

                  ),
                  SizedBox(height: 20),
                  GestureDetector(

                    onTap: (){
                      Navigator.pushNamed(context,
                        AppRoutes.categories, );
                    },
                    child:
                    Text("See more",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.grey),),

                  ),     SizedBox(height: 200),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context),
        ));
  }
  PreferredSizeWidget _buildAppBar2(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 56.h,
      leading: Text(""),

      centerTitle: true,
      title: AppbarTitle(
        text: "Available movies",
      ),
    );
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
      index: 1,
    );
  }


  Future<List<Map>> getAllmovies()async {

    await service_sync_movies();
    Future<List<Map>> locals =  DBMovies.getAllMovies();
    print("getmovies()    with locals $locals");
    return locals;
  }
}

Widget _build_list_movies(BuildContext context, AsyncSnapshot snapshot) {
  if(snapshot.hasData) {
    print("snapshot.hasData");
    List<Map> display_movies_list = snapshot.data as List<Map>;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: display_movies_list.length,
      itemBuilder: (context, index) {

        return GestureDetector(
          onTap: () {

            Navigator.pushNamed(context,AppRoutes.movieSessionsTabContainerScreen,arguments:
            { 'image' : display_movies_list[index]["Movie_image"],
              'name':display_movies_list[index]["Movie_name"],
              'director':display_movies_list[index]["Movie_director"],
              'category':display_movies_list[index]["Movie_duration"],
              'duration':display_movies_list[index]["Movie_category"],
              'description':display_movies_list[index]["Movie_description"], });

          },

          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // color: const Color(0xFF1A2232),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            display_movies_list[index]["Movie_image"], // Assuming you have imagePath defined in Movie
                            height: 280,
                            width: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                        children:[ Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            display_movies_list[index]["Movie_name"], // Assuming you have title defined in Movie
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ]),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        _saveRating(rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );}
  else if(snapshot.hasError){
    print("44444444444444444444444444444");
    return Text("${snapshot.hasError}");
  }
  return CircularProgressIndicator();
}


Widget _buildItem2(BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
  if (snapshot.hasData) {
    List<Movie> displayMoviesList = snapshot.data!;

    return Padding(

      padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.width * 0.025),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: displayMoviesList.length,
          itemBuilder: (context, index) {
            Movie movie = displayMoviesList[index];

            return Container(
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // color: const Color(0xFF1A2232),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            '${cnts.imagePath}${movie.Path}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            movie.title,
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        _saveRating(rating);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  } else if (snapshot.hasError) {
    print("44444444444444444444444444444");
    return Text("${snapshot.error}");
  }
  return CircularProgressIndicator();
}


void _saveRating(double rating) {
  print('Rating: $rating');
}
