// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/mission/mission_model.dart';

class RemoteMissionDataSourceImpl extends IrepositoryMissionDatasource {
  final DbHelper helper;
  RemoteMissionDataSourceImpl({
    required this.helper,
  });
  @override
  Future<int> delete(int id) async {
    final db = await helper.db;
    final response = await db.delete(
      missions,
      where: "id = ?",
      whereArgs: [id],
    );
    return response;
  }

  @override
  Future<List<Mission>> fetchAll() async {
    final db = await helper.db;
    final response = await db.query(
      missions,
      orderBy: "status",
    );
    if (response.isEmpty) {
      return [];
    } else {
      final List<Mission> result = [];
      response
          .map(
            (element) => result.add(
              Mission.fromMap(element),
            ),
          )
          .toList();
      return result;
    }
  }

  @override
  Future<List<Mission>> fetchIncomplited() async {
    final db = await helper.db;
    final response = await db.query(
      missions,
      orderBy: "started",
      where: "status=?",
      whereArgs: ["pending"],
    );
    if (response.isEmpty) {
      return [];
    } else {
      final List<Mission> result = [];
      response
          .map(
            (element) => result.add(
              Mission.fromMap(element),
            ),
          )
          .toList();
      return result;
    }
  }

  @override
  Future<int> insert(Mission model) async {
    final db = await helper.db;
    final response = await db.insert(
      missions,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // ignore: avoid_print
    print("============ response from Database $response =======");
    return response;
  }

  @override
  Future<int> update(int id, Mission model) async {
    final db = await helper.db;
    final result = await db.update(mission, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  /// Write Query for verify existance mission in database
  @override
  Future<bool> verifieExistance(String started, String? finished) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _db = await helper.db;

    final query = await _db.rawQuery(
      """
SELECT * FROM missions WHERE  status=? 
""",
      ["pending"],
    );
    // ignore: avoid_print
    print("============ exist mission $query =======");
    return query.isNotEmpty;
  }

  @override
  Future<Mission?> detailsMission(int id) async {
    final db = await helper.db;
    final response = await db.rawQuery(
      """
SELECT * FROM missions WHERE id=? INNER JOIN tasks ON missions.id = tasks.mission
""",
      [id],
    );

    if (response == null) {
      return null;
    } else {
      final mission = Mission.fromMap(response.first);
      return mission;
    }
  }
}
