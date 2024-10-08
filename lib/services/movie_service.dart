import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {
  final String baseUrl = 'https://moviesdatabase.p.rapidapi.com/titles';
  final Map<String, String> headers = {
    'x-rapidapi-host': 'moviesdatabase.p.rapidapi.com',
    'x-rapidapi-key':
        '15f64dec49msh08c0758011392eep17e2c4jsndd1b23b0cf2d', // Replace with your actual API key
  };

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl), headers: headers);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');

      final data = json.decode(response.body);
      final List<Movie> movies = (data['results'] as List)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
