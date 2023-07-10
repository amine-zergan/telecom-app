// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int? id;
  final String name;
  final String post;
  final String contact;
  const Contact({
    this.id,
    required this.name,
    required this.post,
    required this.contact,
  });

  Contact copyWith({
    int? id,
    String? name,
    String? post,
    String? contact,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      post: post ?? this.post,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'post': post,
      'contact': contact,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      post: map['post'] as String,
      contact: map['contact'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contact(id: $id, name: $name, post: $post, contact: $contact)';
  }

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.post == post &&
        other.contact == contact;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ post.hashCode ^ contact.hashCode;
  }

  @override
  List<Object?> get props => [id, name, contact];
}
