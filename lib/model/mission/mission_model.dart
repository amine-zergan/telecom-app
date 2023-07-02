// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_cast
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:telecom/utils/converter/bool_integer.dart';
import '../../utils/converter/enum/status_mission.dart';
import '../tasks/task_model.dart';

class Mission {
  final int? id;
  final String started;
  final String? finished;
  final bool deplacement;
  final bool equipe;
  final bool depense;
  final int bon;
  final Status status;
  final double depart;
  final double? arrive;
  final String car;
  final double? carburant;
  final String chefequipe;
  final String chefprojet;
  final double? peage;
  final double? achat;
  final List<Task>? tasks;

  Mission({
    this.id,
    required this.started,
    this.finished,
    required this.deplacement,
    required this.equipe,
    required this.depense,
    required this.bon,
    required this.status,
    required this.depart,
    this.arrive,
    required this.car,
    this.carburant,
    required this.chefequipe,
    required this.chefprojet,
    this.peage,
    this.achat,
    this.tasks,
  });

  Mission copyWith({
    int? id,
    String? started,
    String? finished,
    bool? deplacement,
    bool? equipe,
    bool? depense,
    int? bon,
    Status? status,
    double? depart,
    double? arrive,
    String? car,
    double? carburant,
    String? chefequipe,
    String? chefprojet,
    double? peage,
    double? achat,
    List<Task>? tasks,
  }) {
    return Mission(
      id: id ?? this.id,
      started: started ?? this.started,
      finished: finished ?? this.finished,
      deplacement: deplacement ?? this.deplacement,
      equipe: equipe ?? this.equipe,
      depense: depense ?? this.depense,
      bon: bon ?? this.bon,
      status: status ?? this.status,
      depart: depart ?? this.depart,
      arrive: arrive ?? this.arrive,
      car: car ?? this.car,
      carburant: carburant ?? this.carburant,
      chefequipe: chefequipe ?? this.chefequipe,
      chefprojet: chefprojet ?? this.chefprojet,
      peage: peage ?? this.peage,
      achat: achat ?? this.achat,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'started': started,
      'finished': finished,
      'deplacement': BoolConverter.integerFromBool(deplacement),
      'equipe': BoolConverter.integerFromBool(equipe),
      'depense': BoolConverter.integerFromBool(depense),
      'bon': bon,
      'status': status.value(),
      'depart': depart,
      'arrive': arrive,
      'car': car,
      'carburant': carburant,
      'chefequipe': chefequipe,
      'chefprojet': chefprojet,
      'peage': peage,
      'achat': achat,
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      id: map['id'] != null ? map['id'] as int : null,
      started: map['started'] as String,
      finished: map['finished'] != null ? map['finished'] as String : null,
      deplacement: BoolConverter.boolFromInt(map['deplacement'] as int) as bool,
      equipe: BoolConverter.boolFromInt(map['equipe'] as int) as bool,
      depense:
          BoolConverter.boolFromInt((map['depense'] as double).toInt()) as bool,
      bon: 0,
      status: EnumParse.fromString(map['status']),
      depart: map['depart'] as double,
      arrive: map['arrive'] != null ? map['arrive'] as double : null,
      car: map['car'],
      carburant: map['carburant'] != null ? map['carburant'] as double : null,
      chefequipe: map['chefequipe'] as String,
      chefprojet: map['chefprojet'] as String,
      peage: map['peage'] != null ? map['peage'] as double : null,
      achat: map['achat'] != null ? map['achat'] as double : null,
      tasks: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Mission(id: $id, started: $started, finished: $finished, deplacement: $deplacement, equipe: $equipe, depense: $depense, bon: $bon, status: $status, depart: $depart, arrive: $arrive, car: $car, carburant: $carburant, chefequipe: $chefequipe, chefprojet: $chefprojet, peage: $peage, achat: $achat, tasks: $tasks)';
  }

  @override
  bool operator ==(covariant Mission other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.started == started &&
        other.finished == finished &&
        other.deplacement == deplacement &&
        other.equipe == equipe &&
        other.depense == depense &&
        other.bon == bon &&
        other.status == status &&
        other.depart == depart &&
        other.arrive == arrive &&
        other.car == car &&
        other.carburant == carburant &&
        other.chefequipe == chefequipe &&
        other.chefprojet == chefprojet &&
        other.peage == peage &&
        other.achat == achat &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        started.hashCode ^
        finished.hashCode ^
        deplacement.hashCode ^
        equipe.hashCode ^
        depense.hashCode ^
        bon.hashCode ^
        status.hashCode ^
        depart.hashCode ^
        arrive.hashCode ^
        car.hashCode ^
        carburant.hashCode ^
        chefequipe.hashCode ^
        chefprojet.hashCode ^
        peage.hashCode ^
        achat.hashCode ^
        tasks.hashCode;
  }
}
