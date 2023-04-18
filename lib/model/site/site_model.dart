// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telecom/model/components/project/operator_model.dart';

class Site {
  final int? id;
  final String name;
  final Operator operator;
  final String longitude;
  final String latitude;
  final String responsible;
  final String phone;
  final String description;
  final DateTime create;
  Site({
    this.id,
    required this.name,
    required this.operator,
    required this.longitude,
    required this.latitude,
    required this.responsible,
    required this.phone,
    required this.description,
    required this.create,
  });

  Site copyWith({
    int? id,
    String? name,
    Operator? operator,
    String? longitude,
    String? latitude,
    String? responsible,
    String? phone,
    String? description,
    DateTime? create,
  }) {
    return Site(
      id: id ?? this.id,
      name: name ?? this.name,
      operator: operator ?? this.operator,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      responsible: responsible ?? this.responsible,
      phone: phone ?? this.phone,
      description: description ?? this.description,
      create: create ?? this.create,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'operator': operator.toMap(),
      'longitude': longitude,
      'latitude': latitude,
      'responsible': responsible,
      'phone': phone,
      'description': description,
      'create': create.millisecondsSinceEpoch,
    };
  }

  factory Site.fromMap(Map<String, dynamic> map) {
    return Site(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      operator: Operator.fromMap(map['operator'] as Map<String, dynamic>),
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
      responsible: map['responsible'] as String,
      phone: map['phone'] as String,
      description: map['description'] as String,
      create: DateTime.fromMillisecondsSinceEpoch(map['create'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Site.fromJson(String source) =>
      Site.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Site(id: $id, name: $name, operator: $operator, longitude: $longitude, latitude: $latitude, responsible: $responsible, phone: $phone, description: $description, create: $create)';
  }

  @override
  bool operator ==(covariant Site other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.operator == operator &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.responsible == responsible &&
        other.phone == phone &&
        other.description == description &&
        other.create == create;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        operator.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        responsible.hashCode ^
        phone.hashCode ^
        description.hashCode ^
        create.hashCode;
  }
}
