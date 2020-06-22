class Intent {
  String name;
  int confidence;
}

class JournalEntry {
  int id;
  String text;
  int positivityScore;
  Intent intent;
  DateTime createdAt;
  DateTime updatedAt;
}