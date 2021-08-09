class ArticleModel {
  final String id;
  final String title;
  final String body;
  final String department;
  final String v;
  final int likesNumber;
  final int commentsNumber;
  final bool isPinned;

  final String imageUrl;

  ArticleModel(
      {this.id,
      this.title,
      this.body,
      this.department,
      this.v,
      this.imageUrl,
      this.likesNumber,
      this.commentsNumber,
      this.isPinned});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json['id'],
        title: json['title'], //
        body: json['bodyMobile'], //
        v: json['__v'].toString(),
        imageUrl: json['image_url']);
  }
}
