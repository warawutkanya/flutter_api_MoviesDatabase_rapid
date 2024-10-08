class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['titleText']['text'] ?? 'Unknown Title', // Adjusted for title
      imageUrl: json['primaryImage'] != null
          ? json['primaryImage']['url']
          : '', // Adjusted for image URL
    );
  }
}
