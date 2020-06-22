import 'dart:convert';

class Article {
  String id;
  String title;
  String url;
  List<String> tags;

  Article({this.id, this.title, this.url, this.tags});

  factory Article.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonTags = json['tags'];
    List<String> tags = jsonTags != null ? jsonTags.cast<String>() : null;
    return Article(
      id: json['_id'],
      title: json['title'],
      url: json['url'],
      tags: tags,
    );
  }

  Map toJson() => {
        '_id': id,
        'title': title,
        'url': url,
        'tags': jsonEncode(tags.map((tag) => jsonEncode(tag)).toList())
      };
}
