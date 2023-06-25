import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Article {
  final int? id;
  final String ref;
  final String name;
  final String fournisseur;
  final int quantite;
  Article({
    this.id,
    required this.ref,
    required this.name,
    required this.fournisseur,
    required this.quantite,
  });

  Article copyWith({
    int? id,
    String? ref,
    String? name,
    String? fournisseur,
    int? quantite,
  }) {
    return Article(
      id: id ?? this.id,
      ref: ref ?? this.ref,
      name: name ?? this.name,
      fournisseur: fournisseur ?? this.fournisseur,
      quantite: quantite ?? this.quantite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ref': ref,
      'name': name,
      'fournisseur': fournisseur,
      'quantite': quantite,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] != null ? map['id'] as int : null,
      ref: map['ref'] as String,
      name: map['name'] as String,
      fournisseur: map['fournisseur'] as String,
      quantite: map['quantite'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(id: $id, ref: $ref, name: $name, fournisseur: $fournisseur, quantite: $quantite)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ref == ref &&
        other.name == name &&
        other.fournisseur == fournisseur &&
        other.quantite == quantite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ref.hashCode ^
        name.hashCode ^
        fournisseur.hashCode ^
        quantite.hashCode;
  }
}
