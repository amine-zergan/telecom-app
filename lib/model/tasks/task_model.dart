// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/helpers/utils/formater/time_format.dart';

class Task {
  final int? id;
  final String description;
  final int? mission;
  final bool isCompleted;
  final Project? project;
  final Operator? operator;
  final String region;
  final DateTime date;
  Task({
    this.id,
    required this.isCompleted,
    required this.description,
    required this.mission,
    required this.project,
    required this.operator,
    required this.region,
    required this.date,
  });

  Task copyWith({
    int? id,
    String? description,
    int? mission,
    bool? isCompleted,
    Project? project,
    String? region,
    DateTime? date,
    Operator? operator,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      mission: mission ?? this.mission,
      project: project ?? this.project,
      region: region ?? this.region,
      date: date ?? this.date,
      operator: operator ?? this.operator,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTask': id,
      'description': description,
      'mission': mission,
      'isCompleted': isCompleted == true
          ? 1
          : 0, // boolean save to database : sqfilte ne supporte pas bool 1 ou 0
      'project': project?.id,
      'operator': operator?.idOperator,
      'region': region,
      'date': DateFormat.formDate(date),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['idTask'] != null ? map['idTask'] as int : null,
      description: map['description'] as String,
      mission: map['mission'] as int?,
      isCompleted: map['isCompleted'] == 1 ? true : false,
      project: Project(
          id: map['project'], name: map["name"], image: map["imageproject"]),
      operator: Operator(
          idOperator: map['idOperator'],
          operator: map["operator"],
          image: map["image"]),
      region: map['region'] as String,
      date: DateFormat.toDate(map['date'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, description: $description, mission: $mission, project: $project, region: $region, date: $date)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.mission == mission &&
        other.project == project &&
        other.region == region &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        mission.hashCode ^
        project.hashCode ^
        region.hashCode ^
        date.hashCode;
  }
}
