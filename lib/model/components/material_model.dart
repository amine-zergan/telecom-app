// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum Type { indoor, outdoor }

class Equipement {
  final int? id;
  final String name;
  final String ref;
  final Type type;
  Equipement({
    this.id,
    required this.name,
    required this.ref,
    required this.type,
  });

  Equipement copyWith({
    int? id,
    String? name,
    String? ref,
    Type? type,
  }) {
    return Equipement(
      id: id ?? this.id,
      name: name ?? this.name,
      ref: ref ?? this.ref,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'ref': ref,
      'type': type.name.toString(),
    };
  }

  factory Equipement.fromMap(Map<String, dynamic> map) {
    return Equipement(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      ref: map['ref'] as String,
      type: convertvalue(map['type'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipement.fromJson(String source) =>
      Equipement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Equipement(id: $id, name: $name, ref: $ref, type: $type)';
  }

  @override
  bool operator ==(covariant Equipement other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.ref == ref &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ ref.hashCode ^ type.hashCode;
  }
}

Type convertvalue(String name) {
  if (name == Type.indoor.name) {
    return Type.indoor;
  } else {
    return Type.outdoor;
  }
}
