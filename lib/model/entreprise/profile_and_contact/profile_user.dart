// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final int? id;
  final String name;
  final String? address;
  final String codePoste;
  final String post;
  final String phone;
  final String salaire;
  final String niveau;
  final String contract;
  final DateTime createAt;
  final String? image;
  Profile({
    this.id,
    required this.name,
    this.address,
    required this.codePoste,
    required this.post,
    required this.phone,
    required this.salaire,
    required this.niveau,
    required this.contract,
    required this.createAt,
    this.image,
  });

  Profile copyWith({
    int? id,
    String? name,
    String? address,
    String? codePoste,
    String? post,
    String? phone,
    String? salaire,
    String? niveau,
    String? contract,
    DateTime? createAt,
    String? image,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      codePoste: codePoste ?? this.codePoste,
      post: post ?? this.post,
      phone: phone ?? this.phone,
      salaire: salaire ?? this.salaire,
      niveau: niveau ?? this.niveau,
      contract: contract ?? this.contract,
      createAt: createAt ?? this.createAt,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'codePoste': codePoste,
      'post': post,
      'phone': phone,
      'salaire': salaire,
      'niveau': niveau,
      'contract': contract,
      'createAt': createAt.millisecondsSinceEpoch,
      'image': image,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      codePoste: map['codePoste'] as String,
      post: map['post'] as String,
      phone: map['phone'] as String,
      salaire: map['salaire'] as String,
      niveau: map['niveau'] as String,
      contract: map['contract'] as String,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, address: $address, codePoste: $codePoste, post: $post, phone: $phone, salaire: $salaire, niveau: $niveau, contract: $contract, createAt: $createAt, image: $image)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.codePoste == codePoste &&
        other.post == post &&
        other.phone == phone &&
        other.salaire == salaire &&
        other.niveau == niveau &&
        other.contract == contract &&
        other.createAt == createAt &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        codePoste.hashCode ^
        post.hashCode ^
        phone.hashCode ^
        salaire.hashCode ^
        niveau.hashCode ^
        contract.hashCode ^
        createAt.hashCode ^
        image.hashCode;
  }
}
