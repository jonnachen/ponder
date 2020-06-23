import 'dart:convert';

class Article {
  String id;
  String title;
  String url;
  List<String> tags;

  Article({this.id, this.title, this.url, this.tags});

  factory Article.fromJson(Map<String, dynamic> json) {
    print(json);
    List<dynamic> jsonTags = json['tags'];
    print(jsonTags);
    List<String> tags = jsonTags != null ? List.from(jsonTags) : [];
    print(tags);
    return Article(
      id: json['_id'],
      title: json['title'],
      url: json['url'],
      tags: tags,
    );
  }

  Map toJson() =>
      {'_id': id, 'title': title, 'url': url, 'tags': jsonEncode(tags)};
}
