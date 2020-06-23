import 'dart:convert';

class Intent {
  String name;
  double confidence;

  Intent({this.name, this.confidence});

  factory Intent.fromJson(Map<String, dynamic> json) {
    print("no error yet");
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
  double positivityScore;
  Intent intent;
  DateTime createdAt;
  DateTime updatedAt;

  JournalEntry(
      {this.id,
      this.text,
      this.positivityScore,
      this.intent,
      this.createdAt,
      this.updatedAt});

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
        id: json['_id'],
        text: json['text'],
        positivityScore: json['positivityScore'] != null
            ? json['positivityScore'].toDouble()
            : 0.0,
        intent: Intent.fromJson(json['intent']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  Map toJson() => {
        '_id': id,
        'text': text,
        'positivityScore': jsonEncode(positivityScore),
        'intent': jsonEncode(intent),
        'createdAt': jsonEncode(createdAt),
        'updatedAt': jsonEncode(updatedAt)
      };
}
