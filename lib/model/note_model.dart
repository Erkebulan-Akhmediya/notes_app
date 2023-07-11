class NoteModel {
  final String title;

  NoteModel({
    required this.title,
  });

  Map<String, String> toMap() => {
    'title': title,
  };

  factory NoteModel.fromMap(Map<String, dynamic> map) => NoteModel(
    title: map['title'],
  );
}