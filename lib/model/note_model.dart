class NoteModel {
  final String title;
  final String description;

  NoteModel({
    required this.title,
    required this.description,
  });

  Map<String, String> toMap() => {
    'title': title,
    'description': description,
  };

  factory NoteModel.fromMap(Map<String, dynamic> map) => NoteModel(
    title: map['title'],
    description: map['description'],
  );
}