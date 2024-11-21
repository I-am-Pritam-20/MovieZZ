class Movie {
  final String title;
  final String imageUrl;
  final String summary;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.summary,
  });
  
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['name'] ?? 'No Title Available',
      imageUrl: json['image']?['medium'] ?? '',
      summary: json['summary'] ?? 'No Summary Available',
    );
  }
}
