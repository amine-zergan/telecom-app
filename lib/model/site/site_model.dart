// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telecom/model/components/project/operator_model.dart';

class Site {
  final int? id;
  final String name;
  final Operator operator;
  final String longitude;
  final String latitude;
  final String region;
  final String? responsable;
  final String? phone;
  final String? description;

  Site({
    this.id,
    required this.name,
    required this.operator,
    required this.longitude,
    required this.latitude,
    required this.responsable,
    required this.phone,
    required this.region,
    required this.description,
  });

  Site copyWith(
      {int? id,
      String? name,
      Operator? operator,
      String? longitude,
      String? latitude,
      String? responsable,
      String? phone,
      String? description,
      String? region}) {
    return Site(
      id: id ?? this.id,
      name: name ?? this.name,
      operator: operator ?? this.operator,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      responsable: responsable ?? this.responsable,
      phone: phone ?? this.phone,
      region: region ?? this.region,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'operator': operator.id,
      'longitude': longitude,
      'latitude': latitude,
      'responsable': responsable,
      'phone': phone,
      'region': region,
      'description': description,
    };
  }

  factory Site.fromMap(Map<String, dynamic> map) {
    return Site(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      operator: Operator.fromMap(map['operator'] as Map<String, dynamic>),
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
      region: map['region'] as String,
      responsable:
          map['responsable'] != null ? map['responsable'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Site.fromJson(String source) =>
      Site.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Site(id: $id, name: $name, operator: $operator,region: $region ,longitude: $longitude, latitude: $latitude, responsable: $responsable, phone: $phone, description: $description)';
  }

  @override
  bool operator ==(covariant Site other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.operator == operator &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.responsable == responsable &&
        other.phone == phone &&
        other.description == description &&
        other.region == region;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        operator.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        responsable.hashCode ^
        phone.hashCode ^
        region.hashCode ^
        description.hashCode;
  }
}
