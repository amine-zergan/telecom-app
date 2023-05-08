// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/report/models/article_model.dart';

import '../../utils/converter/enum/type_report.dart';

/// type of Report : dpm or drm

class ReportLivraison {
  final int? id;
  final String ref;
  final Operator operator;
  final String demendeur;
  final String destination;
  final DateTime livraision;
  final List<Article> articles;
  final Report type;
  ReportLivraison({
    this.id,
    required this.ref,
    required this.operator,
    required this.demendeur,
    required this.destination,
    required this.livraision,
    required this.articles,
    required this.type,
  });

  ReportLivraison copyWith({
    int? id,
    String? ref,
    Operator? operator,
    String? demendeur,
    String? destination,
    DateTime? livraision,
    List<Article>? articles,
    Report? type,
  }) {
    return ReportLivraison(
      id: id ?? this.id,
      ref: ref ?? this.ref,
      operator: operator ?? this.operator,
      demendeur: demendeur ?? this.demendeur,
      destination: destination ?? this.destination,
      livraision: livraision ?? this.livraision,
      articles: articles ?? this.articles,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ref': ref,
      'operator': operator.toMap(),
      'demendeur': demendeur,
      'destination': destination,
      'livraision': livraision.millisecondsSinceEpoch,
      'articles': articles.map((x) => x.toMap()).toList(),
      'type': type.value(),
    };
  }

  factory ReportLivraison.fromMap(Map<String, dynamic> map) {
    return ReportLivraison(
      id: map['id'] != null ? map['id'] as int : null,
      ref: map['ref'] as String,
      operator: Operator.fromMap(map['operator'] as Map<String, dynamic>),
      demendeur: map['demendeur'] as String,
      destination: map['destination'] as String,
      livraision: DateTime.fromMillisecondsSinceEpoch(map['livraision'] as int),
      articles: List<Article>.from(
        (map['articles'] as List<int>).map<Article>(
          (x) => Article.fromMap(x as Map<String, dynamic>),
        ),
      ),
      type: EnumReport.fromString(map['type'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportLivraison.fromJson(String source) =>
      ReportLivraison.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReportLivraison(id: $id, ref: $ref, operator: $operator, demendeur: $demendeur, destination: $destination, livraision: $livraision, articles: $articles, type: $type)';
  }

  @override
  bool operator ==(covariant ReportLivraison other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ref == ref &&
        other.operator == operator &&
        other.demendeur == demendeur &&
        other.destination == destination &&
        other.livraision == livraision &&
        listEquals(other.articles, articles) &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ref.hashCode ^
        operator.hashCode ^
        demendeur.hashCode ^
        destination.hashCode ^
        livraision.hashCode ^
        articles.hashCode ^
        type.hashCode;
  }
}
