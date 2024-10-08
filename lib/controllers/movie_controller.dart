import 'package:get/get.dart';
import '../services/movie_service.dart';
import '../models/movie.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs; // Observable list of movies
  var isLoading = true.obs; // Loading state

  final MovieService movieService;

  MovieController({required this.movieService});

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  // Function to fetch movies from the service and update state
  void fetchMovies() async {
    try {
      isLoading(true);
      var movieList = await movieService.fetchMovies();
      movies.assignAll(movieList); // Assign fetched movies to observable list
    } finally {
      isLoading(false);
    }
  }
}
