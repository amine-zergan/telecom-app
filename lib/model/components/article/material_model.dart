// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/helpers/utils/converter/enum/indoor_outdoor_enum.dart';

class Equipement {
  final int? id;
  final String ref;
  final String name;
  final String? description;
  final Project project;
  final Qualification type;
  Equipement({
    this.id,
    required this.ref,
    required this.name,
    this.description,
    required this.project,
    required this.type,
  });

  Equipement copyWith({
    int? id,
    String? ref,
    String? name,
    String? description,
    Project? project,
    Qualification? position,
  }) {
    return Equipement(
        id: id ?? this.id,
        ref: ref ?? this.ref,
        name: name ?? this.name,
        description: description ?? this.description,
        project: project ?? this.project,
        // ignore: unnecessary_this
        type: position ?? this.type);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ref': ref,
      'name': name,
      'description': description,
      'project': project.id,
      'type': type.value(),
    };
  }

  factory Equipement.fromMap(Map<String, dynamic> map) {
    return Equipement(
      id: map['id'] != null ? map['id'] as int : null,
      ref: map['ref'] as String,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      project: Project.fromMap(map['project'] as Map<String, dynamic>),
      type: EnumParse.fromString(map["type"] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipement.fromJson(String source) =>
      Equipement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Equipement(id: $id, ref: $ref, name: $name, description: $description, project: $project, position: $type)';
  }

  @override
  bool operator ==(covariant Equipement other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.ref == ref &&
        other.name == name &&
        other.description == description &&
        other.project == project &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        ref.hashCode ^
        name.hashCode ^
        description.hashCode ^
        project.hashCode ^
        type.hashCode;
  }
}
