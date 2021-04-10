class ArticleModel {
  final String id;
  final String title;
  final String body;
  final String department;
  final String v;
  final int likesNumber;
  final int commentsNumber;
  final bool isPinned;

  final String image_url;

  ArticleModel(
      {this.id,
      this.title,
      this.body,
      this.department,
      this.v,
      this.image_url,
      this.likesNumber,
      this.commentsNumber,
      this.isPinned});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        id: json['id'],
        title: json['title'], //
        body: json['body'], //
        v: json['__v'].toString(),
        image_url: json['image_url']);
  }
}
