import 'dart:convert';
import 'article.dart';

class Intent {
  String name;
  double confidence;

  Intent({this.name, this.confidence});

  factory Intent.fromJson(Map<String, dynamic> json) {
    print(json);
    return Intent(
        name: json['name'],
        confidence:
            json['confidence'] != null ? json['confidence'].toDouble() : 0.0);
  }

  Map toJson() => {'name': name, 'confidence': confidence};
}

class JournalEntry {
  String id;
  String text;
  Article article;
  double positivityScore;
  List<Intent> intents;
  DateTime createdAt;
  DateTime updatedAt;

  JournalEntry(
      {this.id,
      this.text,
      this.positivityScore,
      this.intents,
      this.article,
      this.createdAt,
      this.updatedAt});

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    final jsonIntents = json['intents'] as List;
    final intents =
        jsonIntents.map((intent) => Intent.fromJson(intent)).toList();
    return JournalEntry(
        id: json['_id'],
        text: json['text'],
        positivityScore: json['positivityScore'] != null
            ? json['positivityScore'].toDouble()
            : 0.0,
        intents: intents,
        article: Article.fromJson(json['article']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  Map toJson() => {
        '_id': id,
        'text': text,
        'positivityScore': jsonEncode(positivityScore),
        'intents': jsonEncode(intents),
        'article': jsonEncode(article),
        'createdAt': jsonEncode(createdAt.toIso8601String()),
        'updatedAt': jsonEncode(updatedAt.toIso8601String())
      };
}
