import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cinema_ticket_booking_app/presentation/categories_screen/categories.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../details_page/details_page.dart';
import '../explore_page/widgets/topmoviessection_item_widget.dart';
import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  ExplorePageState createState() => ExplorePageState();
}


class ExplorePageState extends State<ExplorePage> {
  String selectedButton = 'Now Showing';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar:_buildAppBar2(context) ,
   //   backgroundColor: const Color(0xFF1A2232),
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildItem(
                      context,
                      'No Time To die',
                      'https://m.media-amazon.com/images/M/MV5BYWQ2NzQ1NjktMzNkNS00MGY1LTgwMmMtYTllYTI5YzNmMmE0XkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg',
                    ),
                    _buildItem(
                      context,
                      'Shang-Chi',
                      'https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_.jpg',
                    ),
                    _buildItem(
                        context,
                        'Us',
                        'https://play-lh.googleusercontent.com/EP7g3C6z7yNzSkNtaqRRUlpozSieRceXlMHMuC1pyh9IRPG_ii3mPcKnZ-9eoXReRtM'                    ),
                  ],
                ),
              ),
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

                height: MediaQuery.of(context).size.height * 0.38,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildItem2(
                      context,
                      'No Time To die',
                      'https://m.media-amazon.com/images/I/81PJCFAgdkL._UF1000,1000_QL80_.jpg',
                    ),
                    _buildItem2(
                      context,
                      'Shang-Chi',
                      'https://m.media-amazon.com/images/M/MV5BMTg1MTY2MjYzNV5BMl5BanBnXkFtZTgwMTc4NTMwNDI@._V1_.jpg',
                    ),
                    _buildItem2(
                      context,
                      'Image 3',
                      'https://bdi.dlpdomain.com/album/9791026813781/couv/M385x862/batman-metal-tome-1.jpg',
                    ),
                  ],
                ),
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
                height: MediaQuery.of(context).size.height * 0.38,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildItem2(
                        context,
                        'DUMB&DUMBER',
                        'https://m.media-amazon.com/images/S/pv-target-images/7abea7c6df632663dc230c445f89da93c1623e0749166c77d5d764c475804905.jpg'                    ),
                    _buildItem2(
                      context,
                      'Night School',
                      'https://source.boomplaymusic.com/buzzgroup2/M00/38/CA/rBEe_GK9ZpWAMhgFAAIwXkjYbS8873.jpg',                    ),
                    _buildItem2(
                      context,
                      'Cooming To AMERICA',
                      'https://img.indiaforums.com/media/640x0/50/3313-e1.jpg',                    ),
                  ],
                ),
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
}

Widget _buildItem(BuildContext context, String title, String imagePath) {
  return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,
          AppRoutes.movieSessionsTabContainerScreen, );
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
       //     color: const Color(0xFF1A2232),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imagePath,
                      height: 250,
                      width: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
      ));
}
Widget _buildItem2(BuildContext context, String title, String imagePath) {
  return Padding(
    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.35, // Increased width
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFF1A2232),
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
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    imagePath,
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
                    title,
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
  );
}



void _saveRating(double rating) {
  print('Rating: $rating');
}
