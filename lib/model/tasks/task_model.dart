// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/model/mission/mission_model.dart';

class Task {
  final int? id;
  final String description;
  final Mission mission;
  final Project project;
  final String region;

  final DateTime date;
  Task({
    this.id,
    required this.description,
    required this.mission,
    required this.project,
    required this.region,
    required this.date,
  });

  Task copyWith({
    int? id,
    String? description,
    Mission? mission,
    Project? project,
    String? region,
    DateTime? date,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      mission: mission ?? this.mission,
      project: project ?? this.project,
      region: region ?? this.region,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'mission': mission.id,
      'project': project.id,
      'region': region,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      description: map['description'] as String,
      mission: Mission.fromMap(map['mission'] as Map<String, dynamic>),
      project: Project.fromMap(map['project'] as Map<String, dynamic>),
      region: map['region'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
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
