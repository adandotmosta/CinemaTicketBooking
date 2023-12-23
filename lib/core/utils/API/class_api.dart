import 'dart:convert';

import 'package:cinema_ticket_booking_app/core/utils/API/model/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
class Api{
  static const trendingURL="https://api.themoviedb.org/3/movie/top_rated?api_key=099607cdfcda12d90eb81fe600e301d7";
  static const tmdbApiKey="099607cdfcda12d90eb81fe600e301d7";
  static const ComedyUrl="https://api.themoviedb.org/3/discover/movie?api_key=099607cdfcda12d90eb81fe600e301d7&with_genres=35";
Future<List<Movie>> getTrendingMovies() async
{
  final response = await http.get(Uri.parse(trendingURL));
  if(response.statusCode==200)
  {
    final decodedData= json.decode(response.body)['results']as List ;
  //  print("++++++++++++ Trending movies ++++++++++++");
   // print(decodedData);
return decodedData.map((movie) => Movie.fromJson(movie)).toList();
  }
  else
  {
    throw Exception("error");
  }
}
Future<List<Movie>> getComedyMovies() async
{
  final response = await http.get(Uri.parse(ComedyUrl));
  if(response.statusCode==200)
  {
    final decodedData= json.decode(response.body)['results']as List ;
   // print("*****33333333333333333333333333332222++++++++++++");
    //print(decodedData);
return decodedData.map((movie) => Movie.fromJson(movie)).toList();
  }
  else
  {
    throw Exception("error");
  }
}

 
}

