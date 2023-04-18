// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class History {
  final int? id;
  final String task;
  final DateTime createAt;
  History({
    this.id,
    required this.task,
    required this.createAt,
  });

  History copyWith({
    int? id,
    String? task,
    DateTime? createAt,
  }) {
    return History(
      id: id ?? this.id,
      task: task ?? this.task,
      createAt: createAt ?? this.createAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'createAt': createAt.millisecondsSinceEpoch,
    };
  }

  factory History.fromMap(Map<String, dynamic> map) {
    return History(
      id: map['id'] != null ? map['id'] as int : null,
      task: map['task'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory History.fromJson(String source) =>
      History.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'History(id: $id, task: $task, createAt: $createAt)';

  @override
  bool operator ==(covariant History other) {
    if (identical(this, other)) return true;

    return other.id == id && other.task == task && other.createAt == createAt;
  }

  @override
  int get hashCode => id.hashCode ^ task.hashCode ^ createAt.hashCode;
}
