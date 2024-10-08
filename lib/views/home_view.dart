import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart'; // Import the MovieController
import '../services/movie_service.dart'; // Import the MovieService
import '../routes/app_routes.dart'; // Import the app routes
import '../models/movie.dart'; // Import the Movie model

class HomeView extends StatelessWidget {
  final MovieController movieController =
      Get.put(MovieController(movieService: MovieService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Obx(() {
        // Show loading indicator while fetching movies
        if (movieController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Display movie list
        return ListView.builder(
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            final movie = movieController.movies[index];
            return ListTile(
              leading: movie.imageUrl.isNotEmpty
                  ? Image.network(
                      movie.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                      child: Icon(Icons.movie),
                    ),
              title: Text(movie.title),
              onTap: () {
                // Navigate to MovieDetailView and pass the selected movie
                Get.toNamed(AppRoutes.MOVIE_DETAIL, arguments: movie.toJson());
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          movieController.fetchMovies(); // Fetch movies on button press
        },
        child: Icon(Icons.refresh), // Refresh icon
      ),
    );
  }
}
