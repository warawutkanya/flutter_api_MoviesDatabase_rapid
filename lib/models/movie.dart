// lib/models/movie.dart
class Movie {
  final String title;
  final String imageUrl;
  final String id;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Safely access the nested properties, providing default values
    String title = json['titleText']?['text'] ?? 'Unknown Title';
    String imageUrl = json['primaryImage']?['url'] ??
        ''; // Default to empty string if not available
    String id = json['id'] ?? ''; // Default to empty string if not available

    return Movie(
      title: title,
      imageUrl: imageUrl,
      id: id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'id': id,
    };
  }
}
