import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com/search/shows?q=';
  
  static Future<List<Movie>> fetchMovies(String query) async {
    final response = await http.get(Uri.parse('$baseUrl$query'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      
      return data.map((e) => Movie.fromJson(e['show'])).toList();
    } else {
      throw Exception('Failed to load movies: ${response.body}');
    }
  }
}
