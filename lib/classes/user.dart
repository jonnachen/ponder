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
    var jsonJournals = json['journals'] as List;
    List<JournalEntry> journals =
        jsonJournals.map((journal) => JournalEntry.fromJson(journal)).toList();
    return User(
        id: json['_id'],
        username: json['username'],
        articles: articles,
        journals: journals,
        loginStreak:
            json['loginStreak'] != null ? int.parse(json['loginStreak']) : 0);
  }

  Map toJson() => {
        '_id': id,
        'username': username,
        'articles': jsonEncode(articles),
        'journals': jsonEncode(journals),
        'loginStreak': '0' //jsonEncode(loginStreak)
      };
}
