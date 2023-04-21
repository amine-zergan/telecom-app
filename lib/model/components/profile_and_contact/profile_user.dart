// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Profile {
  final int? id;
  final String name;
  final String? address;
  final String post;
  final int phone;
  final DateTime createAt;
  final String? image;
  Profile({
    this.id,
    required this.name,
    this.address,
    required this.post,
    required this.phone,
    required this.createAt,
    this.image,
  });

  Profile copyWith({
    int? id,
    String? name,
    String? address,
    String? post,
    int? phone,
    DateTime? createAt,
    String? image,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      post: post ?? this.post,
      phone: phone ?? this.phone,
      createAt: createAt ?? this.createAt,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'post': post,
      'phone': phone,
      'createAt': createAt.millisecondsSinceEpoch,
      'image': image,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      address: map['address'] != null ? map['address'] as String : null,
      post: map['post'] as String,
      phone: map['phone'] as int,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, address: $address, post: $post, phone: $phone, createAt: $createAt, image: $image)';
  }

  @override
  bool operator ==(covariant Profile other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.post == post &&
        other.phone == phone &&
        other.createAt == createAt &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        post.hashCode ^
        phone.hashCode ^
        createAt.hashCode ^
        image.hashCode;
  }
}
