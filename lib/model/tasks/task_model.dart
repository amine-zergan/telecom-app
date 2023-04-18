// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/model/site/site_model.dart';

class Task {
  final int? id;
  final String description;
  final Project project;
  final List<Site> sites;
  final String region;

  final DateTime date;
  Task({
    this.id,
    required this.description,
    required this.sites,
    required this.region,
    required this.project,
    required this.date,
  });

  Task copyWith({
    int? id,
    String? description,
    List<Site>? sites,
    String? region,
    Project? project,
    DateTime? date,
  }) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      sites: sites ?? this.sites,
      region: region ?? this.region,
      project: project ?? this.project,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'sites': sites.map((x) => x.toMap()).toList(),
      'region': region,
      'project': project.toMap(),
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      description: map['description'] as String,
      sites: List<Site>.from(
        (map['sites'] as List<int>).map<Site>(
          (x) => Site.fromMap(x as Map<String, dynamic>),
        ),
      ),
      region: map['region'] as String,
      project: Project.fromMap(map['project'] as Map<String, dynamic>),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, description: $description, sites: $sites, region: $region, project: $project, date: $date)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        listEquals(other.sites, sites) &&
        other.region == region &&
        other.project == project &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        sites.hashCode ^
        region.hashCode ^
        project.hashCode ^
        date.hashCode;
  }
}
