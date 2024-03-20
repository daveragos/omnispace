class News {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      description: json['description'],
      imageUrl: json['urlToImage'],
      url: json['url'],
    );
  }
}
