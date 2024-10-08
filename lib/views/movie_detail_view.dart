import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the movie data passed as arguments
    final movie = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'), // Fixed to display a constant title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie['title'] ?? 'Unknown Title', // Display movie title
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Release Date: ${movie['releaseDate'] ?? 'N/A'}'),
            SizedBox(height: 8),
            Text('Overview: ${movie['overview'] ?? 'N/A'}'),
            // Add more fields as necessary
          ],
        ),
      ),
    );
  }
}
