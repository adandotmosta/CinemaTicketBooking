
import 'package:cinema_ticket_booking_app/core/utils/API/class_api.dart';
import 'package:cinema_ticket_booking_app/core/utils/API/constants.dart';
import 'package:cinema_ticket_booking_app/core/utils/API/model/movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinema_ticket_booking_app/presentation/categories_screen/categories.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

    Future<List<dynamic>?> movie_list = getAllmovies();

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


                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Now Showing movies",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        "Upcoming movies",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        "Top rated movies",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(

                      height: MediaQuery.of(context).size.height * 0.42,
                      child:   FutureBuilder(future: Comedy_movies, builder: _buildItem2)

                  ),
                  SizedBox(height: 20),

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


  Future<List<dynamic>?> getAllmovies() async {
    print("inside get ALl movies");
    List<dynamic>? locals =  await endpoint_api_get_movies();
    print("getting all movies $locals");
    return locals;
  }

}

Widget _build_list_movies(BuildContext context, AsyncSnapshot snapshot) {
  if(snapshot.hasData) {
    List<Map> display_movies_list = snapshot.data ;

    return CarouselSlider.builder(
      itemCount: display_movies_list.length,
      options: CarouselOptions(
        // Define your carousel options here
        height: 500.v,
        aspectRatio: 16 / 9,
        viewportFraction: 0.55,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        var upcoming = display_movies_list[index]["upcoming"];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.movieSessionsTabContainerScreen,
              arguments: {
                'id': display_movies_list[index]["Movie_ID"],
                'vedio' : display_movies_list[index]["Movie_path"],
                'name':display_movies_list[index]["Movie_title"],
                'director':display_movies_list[index]["Movie_director"],
                'category':display_movies_list[index]["Movie_category"],
                'duration':display_movies_list[index]["Movie_duration"],
                'description':display_movies_list[index]["Movie_description"],
                'image':display_movies_list[index]["Image_path"],
                'upcoming' : 0,
              },
            );
          },
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
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
                            display_movies_list[index]["Image_path"],
                            height: 280,
                            width: 190,
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
                            display_movies_list[index]["Movie_title"],
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
            ),
          ),
        );
      },
    );}
  else if(snapshot.hasError){
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
    return Text("${snapshot.error}");
  }
  return CircularProgressIndicator();
}


void _saveRating(double rating) {
  print('Rating: $rating');
}