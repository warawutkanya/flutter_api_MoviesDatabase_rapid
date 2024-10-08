import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MovieService {
  final String baseUrl = 'https://moviesdatabase.p.rapidapi.com/titles';

  final Map<String, String> headers = {
    'x-rapidapi-host': 'moviesdatabase.p.rapidapi.com',
    'x-rapidapi-key':
        '15f64dec49msh08c0758011392eep17e2c4jsndd1b23b0cf2d', // Replace with your actual API key
  };

  // Function to fetch the movies list from the API
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(baseUrl), headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      // Assuming the API returns a 'results' list in the response
      List<dynamic> data = jsonResponse['results'] ?? [];

      // Convert each dynamic item to a Movie object
      return data.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
