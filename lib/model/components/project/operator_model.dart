// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Operator {
  final int? id;
  final String name;
  final String logo;
  Operator({
    this.id,
    required this.name,
    required this.logo,
  });

  Operator copyWith({
    int? id,
    String? name,
    String? logo,
  }) {
    return Operator(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  factory Operator.fromMap(Map<String, dynamic> map) {
    return Operator(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      logo: map['logo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Operator.fromJson(String source) =>
      Operator.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Operator(id: $id, name: $name, logo: $logo)';

  @override
  bool operator ==(covariant Operator other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.logo == logo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ logo.hashCode;
}
