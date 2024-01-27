import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/core/utils/Movie/movie.dart';
import 'package:cinema_ticket_booking_app/core/utils/credentials_imports.dart';
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
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Import statements...

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([readCounter(), fetchUpcomingMovies()]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var creds = snapshot.data?[0];
          var username = creds?["username"];
          var upcomingMovies = snapshot.data?[1];
              print("in snasphot = $upcomingMovies");

          return SafeArea(
            child: Scaffold(
              appBar: _buildWelcomeBackGroup(context, username),
              body: _buildUpcomingMoviesList(context, upcomingMovies),
              bottomNavigationBar: _buildBottomBar(context) ,
              // Rest of your UI...
            ),
          );
        }
      },
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }

  Widget _buildUpcomingMoviesList(BuildContext context, List<dynamic>? movies) {
    print("in upcoming movies = $movies");
    if (movies == null) {
      return Text('No movies available.');
    }

    List<Widget> upcomingMoviesWidgets = [];

    // Filter and create widgets for upcoming movies
    for (var movie in movies) {
      if (movie["upcoming"] == "1") {
        print("inside upcoming = 1");
        upcomingMoviesWidgets.add(
          _buildItem(
            context,
            movie["Movie_ID"],
            movie["Movie_path"],
            movie["Movie_title"],
            movie["Movie_director"],
            movie["Movie_category"],
            movie["Movie_duration"],
            movie["Movie_description"],
            movie["Image_path"],
          ),
        );
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

          children : [
            LocationBox(latitude:554, longitude: 4545),
            videoBox(),

      ],
          ),
          SizedBox(height: 30.v),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Movies',
              style: TextStyle(
                fontSize: 25.adaptSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.v),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: upcomingMoviesWidgets,
          ),
        ],
      ),
    );
  }


  PreferredSizeWidget _buildWelcomeBackGroup(
      BuildContext context, String? username) {
    return CustomAppBar(
      height: 80.v,
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
              text: username ?? "",
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.settingsScreen,
            );
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

  // ... The rest of your code ...

  Future<List<Map<String, dynamic>>?> fetchUpcomingMovies() async {



    List<Map<String, dynamic>>? movies = await endpoint_api_get_movies();
    return movies;
  }
}

Widget _buildItem(
    BuildContext context,
int id,

String video,
String name ,
String director,
String category ,
double duration ,
String description,
String image ,
    ) {
  print("image path = $image");
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.movieSessionsTabContainerScreen,
                  arguments:
                  {
                    'id': id,
                    'vedio' : video,
                    'name':name,
                    'director':director,
                    'category':category,
                    'duration':duration,
                    'description':description,
                    'image':image,
                    'upcoming' : 1,
                  }
              );
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 180,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Text(
              description.substring(0,50)+  '...',
              style: const TextStyle(
                color: Color(0xFFB2B5BB),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class LocationBox extends StatelessWidget {
  final double latitude;
  final double longitude;

  LocationBox({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchMap();
      },
      child: CustomImageView(
        height: 150.v,
        width: 150.h,
        radius: BorderRadius.circular(10.0),
        imagePath : ImageConstant.map_img,

      ),
    );
  }

  void launchMap() async {
    final url = "https://www.google.com/maps/place/Garden+City+Mall/@36.7513107,2.9525833,15z/data=!4m12!1m5!3m4!2zMzbCsDQ1JzA0LjgiTiAywrA1NycwOS4zIkU!8m2!3d36.7513333!4d2.9525833!3m5!1s0x128fb1d985c931cb:0x86715ddc1a8bad42!8m2!3d36.7508332!4d2.951837!16s%2Fg%2F11fmzsmwgh?entry=ttu";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void _showVideoPopup(BuildContext context,String movie_vedio_path) async {
  // String videoId = await getMovieVideoUrl(movieName)??""; // Replace with your actual async logic

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 300.h,
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: '${movie_vedio_path}',
              flags: YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
          ),
        ),
      );
    },
  );
}




class videoBox extends StatelessWidget {


@override
Widget build(BuildContext context) {
return Container(
  height: 150.h,
  width: 150.h,


  clipBehavior: Clip.antiAlias,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Stack(
    alignment: Alignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child:CustomImageView(
          imagePath: ImageConstant.tmv,
        ),
      ),
      Positioned(
        child: GestureDetector(
          onTap: () async {


//final MovieName = movieName; // Replace with the actual movie name
//final videoUrl = await getMovieVideoUrl(MovieName);

            _showVideoPopup(context,"https://www.youtube.com/watch?v=B_UvdLYSk7Q");

/*try {
                              final uri = Uri.parse(videoUrl!); // Convert the String to Uri

                              launch(videoUrl);


                            } catch (e) {
                              print('Error launching URL: $e');
                            }*/






          },child :Icon(
          Icons.play_circle,
          color: Colors.blue,
          size: 65,
        ),
        ),
      )],
  ),
);
}
}