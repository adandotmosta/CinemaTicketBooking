import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class FilmCategories extends StatefulWidget {
  const FilmCategories({Key? key}) : super(key: key);

  @override
  _FilmCategoriesState createState() => _FilmCategoriesState();
}

class _FilmCategoriesState extends State<FilmCategories> {
  final List<Map<String, String>> categories = [
    {'name': 'Horror', 'imagePath': 'https://play-lh.googleusercontent.com/EP7g3C6z7yNzSkNtaqRRUlpozSieRceXlMHMuC1pyh9IRPG_ii3mPcKnZ-9eoXReRtM'},
    {'name': 'Funny', 'imagePath': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
    {'name': 'Family', 'imagePath': 'https://i.insider.com/52d999c36bb3f7c84f769275?width=750&format=jpeg&auto=webp'},
    {'name': 'Action', 'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRba2PZ_rxfGJLqmzAhyUT6BlDNg_FiyskqNQ&usqp=CAU'},
    {'name': 'Children', 'imagePath': 'https://images.moviesanywhere.com/380959ce0a4228361a72ebec30175308/663a2106-6091-48ff-aa51-c4f9819bcc5c.jpg'},
  ];

  final Map<String, List<Map<String, String>>> categoryDetails = {
    'Horror': [
      {'name': 'Image 1', 'path': 'https://play-lh.googleusercontent.com/EP7g3C6z7yNzSkNtaqRRUlpozSieRceXlMHMuC1pyh9IRPG_ii3mPcKnZ-9eoXReRtM'},
      {'name': 'Image 2', 'path': 'https://play-lh.googleusercontent.com/EP7g3C6z7yNzSkNtaqRRUlpozSieRceXlMHMuC1pyh9IRPG_ii3mPcKnZ-9eoXReRtM'},
      {'name': 'Image 3', 'path': 'https://play-lh.googleusercontent.com/EP7g3C6z7yNzSkNtaqRRUlpozSieRceXlMHMuC1pyh9IRPG_ii3mPcKnZ-9eoXReRtM'},
    ],
    'Funny': [
      {'name': 'Image 1', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
      {'name': 'Image 2', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
      {'name': 'Image 3', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
       {'name': 'Image 1', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
      {'name': 'Image 2', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
       {'name': 'Image 1', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
      {'name': 'Image 2', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
      {'name': 'Image 3', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
      {'name': 'Image 3', 'path': 'https://i.pinimg.com/originals/19/48/41/194841466837b8ba3b9c755ae4610908.jpg'},
    ],
    'Family': [
      {'name': 'Image 1', 'path': 'https://i.insider.com/52d999c36bb3f7c84f769275?width=750&format=jpeg&auto=webp'},
      {'name': 'Image 2', 'path': 'https://i.insider.com/52d999c36bb3f7c84f769275?width=750&format=jpeg&auto=webp'},
      {'name': 'Image 3', 'path': 'https://i.insider.com/52d999c36bb3f7c84f769275?width=750&format=jpeg&auto=webp'},
    ],
    'Action': [
      {'name': 'Image 1', 'path': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRba2PZ_rxfGJLqmzAhyUT6BlDNg_FiyskqNQ&usqp=CAU'},
      {'name': 'Image 2', 'path': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRba2PZ_rxfGJLqmzAhyUT6BlDNg_FiyskqNQ&usqp=CAU'},
      {'name': 'action', 'path': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRba2PZ_rxfGJLqmzAhyUT6BlDNg_FiyskqNQ&usqp=CAU'},
    ],
    'Children': [
      {'name': 'Image 1', 'path': 'https://images.moviesanywhere.com/380959ce0a4228361a72ebec30175308/663a2106-6091-48ff-aa51-c4f9819bcc5c.jpg'},
      {'name': 'Image 2', 'path': 'https://images.moviesanywhere.com/380959ce0a4228361a72ebec30175308/663a2106-6091-48ff-aa51-c4f9819bcc5c.jpg'},
      {'name': 'Image 3', 'path': 'https://images.moviesanywhere.com/380959ce0a4228361a72ebec30175308/663a2106-6091-48ff-aa51-c4f9819bcc5c.jpg'},
    ],
  };

  String selectedCategory = 'Children';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      appBar: _buildAppBar2(context),
     // backgroundColor: const Color(0xFF1A2232),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Search for a Category",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  TextField(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 40, 39, 39),
                    fontSize: 13,),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff6F7277),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search For A Category",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 40, 39, 39),
                      fontSize: 13),
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Color.fromARGB(255, 40, 39, 39),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Horizontal List View
             Container(
  height: 150,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = categories[index]['name']!;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(120),
                  child:
                Image.network(categories[index]['imagePath']!,
                  fit:BoxFit.cover,
                  width:80,height: 80,
                ), // Fixing the syntax error here
               ), ),
              const SizedBox(height: 8),
              Text(
                categories[index]['name']!,
                style: TextStyle(
                  color: selectedCategory == categories[index]['name']
                      ? Colors.blue
                      : Colors.white,
               fontSize: 16 ),
              ),
            ],
          ),
        ),
      );
    },
  ),
),

              
              // Vertical List View
              if (selectedCategory.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "$selectedCategory movies",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Wrap(
                        spacing: 19.0,
                        runSpacing: 9.0,
                        children: List.generate(
                          categoryDetails[selectedCategory]?.length ?? 0,
                          (index) {
                            return _buildItem2(
                              context,
                              categoryDetails[selectedCategory]![index]['name']!,
                              categoryDetails[selectedCategory]![index]['path']!,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
     
    bottomNavigationBar: _buildBottomBar(context),));
  }
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
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
      text: " movies categories",
    ),
  );
}
}

Widget _buildItem2(BuildContext context, String title, String imagePath) {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Container(
      width: 120, // Increased width
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color:  Color(0xFF1A2232),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){

                Navigator.pushNamed(context,
                  AppRoutes.movieSessionsTabContainerScreen, );
              },
              child: Container(
  height: 200,
  clipBehavior: Clip.antiAlias,
  decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(15) // Adjust the radius as needed
  ),
  child: Image.network(
        imagePath,
    fit: BoxFit.cover,
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
