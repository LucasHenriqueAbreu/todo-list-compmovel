class Task {
  int id;
  String title;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.isDone,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }
}
