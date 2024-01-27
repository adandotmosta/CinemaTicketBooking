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

          return SafeArea(
            child: Scaffold(
              appBar: _buildWelcomeBackGroup(context, username),
              body: _buildUpcomingMoviesList(context, upcomingMovies),
              // Rest of your UI...
            ),
          );
        }
      },
    );
  }

  Widget _buildUpcomingMoviesList(BuildContext context, List<dynamic>? movies) {
    if (movies == null) {
      return Text('No upcoming movies available.');
    }

    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        // Build your widget for each upcoming movie
        return ListTile(
          title: Text(movie['title']),
          subtitle: Text(movie['releaseDate']),
          // Add more details as needed
        );
      },
    );
  }

  PreferredSizeWidget _buildWelcomeBackGroup(
      BuildContext context, String? username) {
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

  Future<List<dynamic>> fetchUpcomingMovies() async {

    return [
      [ 'Resident Evil - Racoon City',
      'November 2024',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6tcJWhWx_qhPOH4Kb-0m-4RRZuSFkKhd3EeMJ6CNqyE5TcrGyOuPXmtEq5lu89XYWkdc&usqp=CAU',
      ]
    ];
  }
}
