// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FilterContact {
  final double? slider;
  final String? contact;
  final List<String>? posts;
  FilterContact({
    this.slider,
    this.contact,
    this.posts,
  });

  FilterContact copyWith({
    double? slider,
    String? contact,
    List<String>? posts,
  }) {
    return FilterContact(
      slider: slider ?? this.slider,
      contact: contact ?? this.contact,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slider': slider,
      'contact': contact,
      'posts': posts,
    };
  }

  factory FilterContact.fromMap(Map<String, dynamic> map) {
    return FilterContact(
      slider: map['slider'] != null ? map['slider'] as double : null,
      contact: map['contact'] != null ? map['contact'] as String : null,
      posts: map['posts'] != null
          ? List<String>.from((map['posts'] as List<String>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterContact.fromJson(String source) =>
      FilterContact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FilterContact(slider: $slider, contact: $contact, posts: $posts)';

  @override
  bool operator ==(covariant FilterContact other) {
    if (identical(this, other)) return true;

    return other.slider == slider &&
        other.contact == contact &&
        listEquals(other.posts, posts);
  }

  @override
  int get hashCode => slider.hashCode ^ contact.hashCode ^ posts.hashCode;
}
