
// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/core/utils/API/constants.dart';
import 'package:cinema_ticket_booking_app/presentation/select_seats_screen/select_seats_screen.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {


  const DetailsPage({Key? key}) : super(key: key);

  @override

  State<DetailsPage> createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    var args = (ModalRoute.of(context)!.settings.arguments);
    var image_path = "";
    String movieName="";
    String movieDirector="";
    String movieCategory="";
    String movieDuration="";
    String movieDescription="";
    if(args is Map){
      image_path  = args["image"];
      movieName=args["name"];
      movieDirector=args["director"];
      movieCategory=args["category"];
      movieDuration=args["duration"];
      movieDescription=args["description"];
    }
    String directorText = "Director: $movieDirector";


    Future<List<String>> imagePaths =getMovieImages(movieName);
    Future<List<Map<String, String>>> movieCast=getMovieCast(movieName);

    return SafeArea(
        child: Scaffold(
          //  appBar:_buildAppBar2(context,movieName),

          //     backgroundColor: const Color(0xFF1A2232),
          body: SingleChildScrollView(child: Column(
              children: [

                SizedBox(
                  height: 390,

                  child: FutureBuilder<List<String>>(
                    future: getMovieImages(movieName),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text('No images found for the specified movie.');
                      } else {
                        List<String> imagePaths = snapshot.data!;

                        return Container(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [

                              _buildItem('${cnts.imagePath}${imagePaths[0]}'),
                              _buildItem('${cnts.imagePath}${imagePaths[5]}'),
                              _buildItem('${cnts.imagePath}${imagePaths[6]}'),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),

                _description(movieName, directorText,movieDuration,movieCategory),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text ("Synopsis",style: TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),

                      Text(movieDescription,style: TextStyle(color: Color(0xffB2B5BB),fontSize:16,),)
                    ],),),
                SizedBox(height: 30,),

                Padding( padding: EdgeInsets.symmetric(horizontal: 20.0),child: Container(
                  height: 300,
                  width: 500,

                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          image_path,
                          fit: BoxFit.cover,
                          height: 300,
                          width: 500,
                        ),
                      ),
                      Positioned(
                        child: GestureDetector(
                          onTap: () async {


                            final MovieName = movieName; // Replace with the actual movie name
                            final videoUrl = await getMovieVideoUrl(MovieName);

                            try {
                              final uri = Uri.parse(videoUrl!); // Convert the String to Uri

                              launch(videoUrl);


                            } catch (e) {
                              print('Error launching URL: $e');
                            }





                          },child :Icon(
                          Icons.play_circle,
                          color: Colors.yellow,
                          size: 65,
                        ),
                        ),
                      )],
                  ),
                )
                ),
                FutureBuilder<List<Map<String, String>>>(
                  future: movieCast,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // If the Future is still running, show a loading indicator
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // If there's an error, show an error message
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // If there's no data, or the data is empty, show a message
                      return Text('No cast information available.');
                    } else {
                      // If data is available, display it using a ListView.builder
                      return Container(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final castMember = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(
                                        '${cnts.imagePath}${castMember['profile_path']!}',
                                        fit: BoxFit.cover,
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    castMember['original_name']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),


                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF54A8E5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 320,
                  height: 60,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder:(context) => SelectSeatsScreen()),
                      );
                    },
                    child: const Text(
                      'Book Ticket',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),

                ),
                SizedBox(height: 20,)]),
            // const Spacer(),



          ),
        ));

  }



  Future<List<String>> getMovieImages(  String movieName) async {
    List<String> imagePaths = [];
    String apiKey="099607cdfcda12d90eb81fe600e301d7";
    // Step 1: Search for the movie ID using the movie name
    final searchUrl = Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$movieName');
    final searchResponse = await http.get(searchUrl);

    if (searchResponse.statusCode == 200) {
      final searchResult = json.decode(searchResponse.body);

      // Check if any movies were found
      if (searchResult['results'] != null && searchResult['results'].isNotEmpty) {
        final movieId = searchResult['results'][0]['id'];

        // Step 2: Get the images for the movie using the movie ID
        final imageUrl = Uri.parse('https://api.themoviedb.org/3/movie/$movieId/images?api_key=$apiKey');
        final imageResponse = await http.get(imageUrl);

        if (imageResponse.statusCode == 200) {
          final imageResult = json.decode(imageResponse.body);

          // Check if any images are available
          if (imageResult['posters'] != null && imageResult['posters'].isNotEmpty) {
            for (var poster in imageResult['posters']) {
              final filePath = poster['file_path'];
              imagePaths.add(filePath);

              // Break the loop if we have collected three images
              if (imagePaths.length == 30) {
                break;
              }
            }

            print("Image File Paths: $imagePaths");

            return imagePaths;
          }
        }
      }
    }

    // Return an empty list if no images are found
    return [];
  }

  Widget _description(String title, String director,String Category,String duration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical:5),
          child: Row(
            children: [

              Flexible(
                child: Text(

                  director,
                  style: const TextStyle(
                    color: Color(0xffBABFC9),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff252932),
                ),

                width: 120,
                height: 45,
                child:  Center(
                  child: Text(Category,style: TextStyle(color: Color(0xffB2B5BB)),),
                ),
              ),

              SizedBox(width: 20,),
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Color(0xff252932),
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 120,
                height: 40,

                child:  Center(
                  child: Text("type2",style: TextStyle(color: Color(0xffB2B5BB)),),
                ),
              ),


              SizedBox(width: 20,),
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff252932),
                ),
                width: 80,
                height: 40,

                child:  Center(
                  child: Text(duration,style: TextStyle(color: Color(0xffB2B5BB)),),
                ),
              ),


            ],
          ),
        ),

      ],
    );
  }

/*Widget ScrollableTextWidget(String text) {
  return SingleChildScrollView(
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
    ),
  );
}*/

  Widget _buildItem(String img) {
    return Padding(
      padding:EdgeInsets.all(20.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF1A2232),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 350,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(

                img,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Future<String?> getMovieVideoUrl( String movieName) async {
    final tmdbBaseUrl = 'https://api.themoviedb.org/3';
    final searchEndpoint = '/search/movie';
    String apiKey='099607cdfcda12d90eb81fe600e301d7';
    // Step 1: Search for the movie ID using the movie name
    final searchUrl = Uri.parse('$tmdbBaseUrl$searchEndpoint?api_key=$apiKey&query=$movieName');
    final searchResponse = await http.get(searchUrl);

    if (searchResponse.statusCode == 200) {
      final searchResult = json.decode(searchResponse.body);

      // Check if any movies were found
      if (searchResult['results'] != null && searchResult['results'].isNotEmpty) {
        final movieId = searchResult['results'][0]['id'];

        // Step 2: Get the videos for the movie using the movie ID
        final videoUrl = Uri.parse('$tmdbBaseUrl/movie/$movieId/videos?api_key=$apiKey');
        final videoResponse = await http.get(videoUrl);

        if (videoResponse.statusCode == 200) {
          final videoResult = json.decode(videoResponse.body);

          // Check if any videos are available
          if (videoResult['results'] != null && videoResult['results'].isNotEmpty) {
            // Find the first video with type "Trailer"
            final trailerVideo = videoResult['results'].firstWhere(
                  (video) => video['type'] == 'Trailer',
              orElse: () => null,
            );

            if (trailerVideo != null) {
              final trailerKey = trailerVideo['key'];

              // Construct the YouTube URL
              final youtubeUrl = 'https://www.youtube.com/watch?v=$trailerKey';
              print(youtubeUrl);

              return youtubeUrl;
            }
          }
        }
      }
    }

    // Return null if no trailer URL is found
    return null;
  }


  Future<List<Map<String, String>>> getMovieCast(String movieName) async {
    final tmdbBaseUrl = 'https://api.themoviedb.org/3';
    final searchEndpoint = '/search/movie';
    String apiKey = '099607cdfcda12d90eb81fe600e301d7';

    // Step 1: Search for the movie ID using the movie name
    final searchUrl =
    Uri.parse('$tmdbBaseUrl$searchEndpoint?api_key=$apiKey&query=$movieName');
    final searchResponse = await http.get(searchUrl);

    if (searchResponse.statusCode == 200) {
      final searchResult = json.decode(searchResponse.body);

      // Check if any movies were found
      if (searchResult['results'] != null && searchResult['results'].isNotEmpty) {
        final movieId = searchResult['results'][0]['id'];

        // Step 2: Get the credits for the movie using the movie ID
        final castUrl = Uri.parse('$tmdbBaseUrl/movie/$movieId/credits?api_key=$apiKey');
        final castResponse = await http.get(castUrl);

        if (castResponse.statusCode == 200) {
          final castResult = json.decode(castResponse.body);

          // Extracting information for all cast members
          if (castResult['cast'] != null && castResult['cast'].isNotEmpty) {
            final List<Map<String, String>> castList = [];

            for (final castMember in castResult['cast']) {
              final originalName = castMember['original_name'];
              final profilePath = castMember['profile_path'];

              // Add cast member information to the list
              if (profilePath != null ){castList.add({
                'original_name': originalName ?? '',
                'profile_path': profilePath ?? '',
              });}
            }

            // Return the list of cast members
            return castList;
          }
        }
      }
    }

    // Return an empty list if no cast information is found
    return [];
  }



/*PreferredSizeWidget _buildAppBar2(BuildContext context,String title) {
>>>>>>> origin/secondSubmission
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
<<<<<<< HEAD
        text: "Shang-Chi",
=======
        text: title,
>>>>>>> origin/secondSubmission
      ),
      //about and session

    );
<<<<<<< HEAD
  }
=======
  }*/
}
ChewieController _buildVideoPlayerController(String videoUrl) {
  final videoPlayerController = VideoPlayerController.network(videoUrl);
  final chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: false,
    looping: true,
  );
  return chewieController;
}
