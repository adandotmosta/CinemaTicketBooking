import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/presentation/select_seats_screen/select_seats_screen.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class DetailsPage extends StatelessWidget {

  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> categories = [
      {'name': 'Simu Liu', 'imagePath': 'https://cdn.britannica.com/06/242206-050-E18E3ABD/Simu-Liu-actor-2022.jpg'},
      {'name': 'Awkwafina', 'imagePath': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Awkwafina%2C_2018_%28cropped%29.jpg/640px-Awkwafina%2C_2018_%28cropped%29.jpg'},
      {'name': 'Tony Leung', 'imagePath': 'https://i.mydramalist.com/wPpBn_5_c.jpg'},
      {'name': 'Simu Liu', 'imagePath': 'https://cdn.britannica.com/06/242206-050-E18E3ABD/Simu-Liu-actor-2022.jpg'},
      {'name': 'Awkwafina', 'imagePath': 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Awkwafina%2C_2018_%28cropped%29.jpg/640px-Awkwafina%2C_2018_%28cropped%29.jpg'},
      {'name': 'Tony Leung', 'imagePath': 'https://i.mydramalist.com/wPpBn_5_c.jpg'},
    ];
    return SafeArea(
        child: Scaffold(

     //     backgroundColor: const Color(0xFF1A2232),
          body: SingleChildScrollView(child: Column(
              children: [

                SizedBox(
                  height: 390,

                  child: Container(

                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildItem('https://m.media-amazon.com/images/M/MV5BNTliYjlkNDQtMjFlNS00NjgzLWFmMWEtYmM2Mzc2Zjg3ZjEyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg'),
                        _buildItem('https://assets1.ignimgs.com/2021/04/21/shang-chi-explained-blogroll-1619045382793_160w.jpg?width=1280'),
                        _buildItem('https://i.ytimg.com/vi/V28PXZ60MGY/maxresdefault.jpg'),
                        _buildItem('https://www.ctvnews.ca/content/dam/ctvnews/en/images/2021/9/2/shang-chi-and-the-legend-of-the-ten-rings-1-5570952-1630593947038.jpg'),
                      ],
                    ),
                  ),
                ),
                _description("Shang - Chi", "Director: Destin Daniel Cretton"),
                const  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text ("Synopsis",style: TextStyle(color:Colors.white,fontSize:22,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Text("Martial-arts master Shang-Chi confronts thehst he thoughtthoughtthnfron thehe past he thoughtthoughtth left behind when he's drawn into ",style: TextStyle(color: Color(0xffB2B5BB),fontSize:16,),)
                    ],),),
                SizedBox(height: 30,),

                Padding( padding: EdgeInsets.symmetric(horizontal: 20.0),child: Container(
                  height: 300,
                  width: 500,
                  // Adjust the height according to your needs
                  child: Chewie(
                    controller: _buildVideoPlayerController(
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                    ),
                  ),
                ), ),
                Container(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
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
                                  categories[index]['imagePath']!,
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              categories[index]['name']!,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),


/*                Container(
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
                ),*/
                SizedBox(height: 20,)]),
            // const Spacer(),



          ),
        ));

  }

  Widget _description(String title, String description) {
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
                  description,
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
                width: 70,
                height: 40,
                child: const Center(
                  child: Text("Action",style: TextStyle(color: Color(0xffB2B5BB)),),
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
                child: const Center(
                  child: Text("Fiction Fantasy",style: TextStyle(color: Color(0xffB2B5BB)),),
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
                child: const Center(
                  child: Text("02h 43m",style: TextStyle(color: Color(0xffB2B5BB)),),
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
/*    */

  Widget _buildItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 300,
        decoration: const BoxDecoration(
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
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
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
        text: "Shang-Chi",
      ),
      //about and session

    );
  }
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
