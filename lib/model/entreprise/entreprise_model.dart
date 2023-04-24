// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Entreprise {
  final int? id;
  final String name;
  final String? taille;
  final String address;
  final String codepostal;
  final String? logo;
  Entreprise({
    this.id,
    required this.name,
    required this.taille,
    required this.address,
    required this.codepostal,
    this.logo,
  });

  Entreprise copyWith({
    int? id,
    String? name,
    String? taille,
    String? address,
    String? codepostal,
    String? logo,
  }) {
    return Entreprise(
      id: id ?? this.id,
      name: name ?? this.name,
      taille: taille ?? this.taille,
      address: address ?? this.address,
      codepostal: codepostal ?? this.codepostal,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'taille': taille,
      'address': address,
      'codepostal': codepostal,
      'logo': logo,
    };
  }

  factory Entreprise.fromMap(Map<String, dynamic> map) {
    return Entreprise(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      taille: map['taille'] != null ? map['taille'] as String : null,
      address: map['address'] as String,
      codepostal: map['codepostal'] as String,
      logo: map['logo'] != null ? map['logo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Entreprise.fromJson(String source) =>
      Entreprise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Entreprise(id: $id, name: $name, taille: $taille, address: $address, codepostal: $codepostal, logo: $logo)';
  }

  @override
  bool operator ==(covariant Entreprise other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.taille == taille &&
        other.address == address &&
        other.codepostal == codepostal &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        taille.hashCode ^
        address.hashCode ^
        codepostal.hashCode ^
        logo.hashCode;
  }
}
