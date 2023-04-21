// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Site {
  final int? id;
  final String name;
  final int operatorId;
  final String longitude;
  final String latitude;
  final String? responsible;
  final String? phone;
  final String? description;
  final DateTime create;
  Site({
    this.id,
    required this.name,
    required this.operatorId,
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
    int? operatorId,
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
      operatorId: operatorId ?? this.operatorId,
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
      'operatorId': operatorId,
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
      operatorId: map['operatorId'] as int,
      longitude: map['longitude'] as String,
      latitude: map['latitude'] as String,
      responsible:
          map['responsible'] != null ? map['responsible'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      create: DateTime.fromMillisecondsSinceEpoch(map['create'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Site.fromJson(String source) =>
      Site.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Site(id: $id, name: $name, operatorId: $operatorId, longitude: $longitude, latitude: $latitude, responsible: $responsible, phone: $phone, description: $description, create: $create)';
  }

  @override
  bool operator ==(covariant Site other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.operatorId == operatorId &&
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
        operatorId.hashCode ^
        longitude.hashCode ^
        latitude.hashCode ^
        responsible.hashCode ^
        phone.hashCode ^
        description.hashCode ^
        create.hashCode;
  }
}
