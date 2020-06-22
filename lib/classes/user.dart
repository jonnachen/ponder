import 'dart:convert';
import "article.dart";
import "journalEntry.dart";

class User {
  String id;
  String username;
  List<Article> articles;
  List<JournalEntry> journals;
  int loginStreak;

  User(
      {this.id, this.username, this.articles, this.journals, this.loginStreak});

  factory User.fromJson(Map<String, dynamic> json) {
    var jsonArticles = json['articles'] as List;
    List<Article> articles =
        jsonArticles.map((article) => Article.fromJson(article)).toList();
    return User(
        id: json['_id'],
        username: json['username'],
        articles: articles,
        journals: [],
        loginStreak:
            json['loginStreak'] != null ? int.parse(json['loginStreak']) : 0);
  }

  Map toJson() {
    print('yoooooo');
    return {
      '_id': id,
      'username': username,
      'articles':
          jsonEncode(articles.map((article) => jsonEncode(article)).toList()),
      'journals':
          '[]', //jsonEncode(journals.map((journal) => jsonEncode(journal))),
      'loginStreak': '0' //jsonEncode(loginStreak)
    };
  }
}
