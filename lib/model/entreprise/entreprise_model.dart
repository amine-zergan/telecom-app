// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Entreprise {
  final int? id;
  final String name;
  final String? taille;
  final String address;
  final String? departement;
  final String contract;
  final String? logo;
  Entreprise({
    this.id,
    required this.name,
    required this.taille,
    required this.address,
    this.departement,
    required this.contract,
    this.logo,
  });

  Entreprise copyWith({
    int? id,
    String? name,
    String? taille,
    String? address,
    String? departement,
    String? contract,
    String? logo,
  }) {
    return Entreprise(
      id: id ?? this.id,
      name: name ?? this.name,
      taille: taille ?? this.taille,
      address: address ?? this.address,
      departement: departement ?? this.departement,
      contract: contract ?? this.contract,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'taille': taille,
      'address': address,
      'departement': departement,
      'contract': contract,
      'logo': logo,
    };
  }

  factory Entreprise.fromMap(Map<String, dynamic> map) {
    return Entreprise(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      taille: map['taille'] != null ? map['taille'] as String : null,
      address: map['address'] as String,
      departement:
          map['departement'] != null ? map['departement'] as String : null,
      contract: map['contract'] as String,
      logo: map['logo'] != null ? map['logo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Entreprise.fromJson(String source) =>
      Entreprise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Entreprise(id: $id, name: $name, taille: $taille, address: $address, departement: $departement, contract: $contract, logo: $logo)';
  }

  @override
  bool operator ==(covariant Entreprise other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.taille == taille &&
        other.address == address &&
        other.departement == departement &&
        other.contract == contract &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        taille.hashCode ^
        address.hashCode ^
        departement.hashCode ^
        contract.hashCode ^
        logo.hashCode;
  }
}
