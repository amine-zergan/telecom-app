// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Mission {
  final int? id;
  Mission({
    this.id,
  });

  Mission copyWith({
    int? id,
  }) {
    return Mission(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Mission(id: $id)';

  @override
  bool operator ==(covariant Mission other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
