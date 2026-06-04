class ArticleModel {
  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String category;
  final String readTime;
  final String imageUrl;

  ArticleModel({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.category,
    required this.readTime,
    required this.imageUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      category: json['category'] as String,
      readTime: json['readTime'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
