// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Operator {
  final int? id;
  final String name;
  final String image;
  Operator({
    this.id,
    required this.name,
    required this.image,
  });

  Operator copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return Operator(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory Operator.fromMap(Map<String, dynamic> map) {
    return Operator(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Operator.fromJson(String source) =>
      Operator.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Operator(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant Operator other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
