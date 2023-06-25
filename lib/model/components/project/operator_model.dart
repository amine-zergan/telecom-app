// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Operator {
  final int? idOperator;
  final String operator;
  final String image;
  Operator({
    this.idOperator,
    required this.operator,
    required this.image,
  });

  Operator copyWith({
    int? idOperator,
    String? operator,
    String? image,
  }) {
    return Operator(
      idOperator: idOperator ?? this.idOperator,
      operator: operator ?? this.operator,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idOperator': idOperator,
      'operator': operator,
      'image': image,
    };
  }

  factory Operator.fromMap(Map<String, dynamic> map) {
    return Operator(
      idOperator: map['idOperator'] != null ? map['idOperator'] as int : null,
      operator: map['operator'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Operator.fromJson(String source) =>
      Operator.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Operator(id: $idOperator, operator: $operator, image: $image)';

  @override
  bool operator ==(covariant Operator other) {
    if (identical(this, other)) return true;

    return other.idOperator == idOperator &&
        other.operator == operator &&
        other.image == image;
  }

  @override
  int get hashCode => idOperator.hashCode ^ operator.hashCode ^ image.hashCode;
}
