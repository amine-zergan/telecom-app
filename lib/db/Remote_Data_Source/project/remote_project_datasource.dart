// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:sqflite/sqflite.dart';

import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/components/project/project_model.dart';

class RemoteProjectDataSourceImpl extends IrepositoryProjectDatasource {
  final DbHelper helper;
  RemoteProjectDataSourceImpl({
    required this.helper,
  });
  @override
  Future<int> addOperator(Project model) async {
    final _db = await helper.db;
    final response = await _db.insert(projects, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  @override
  Future<int> deleteOperator(int id) async {
    final _db = await helper.db;
    final response =
        await _db.delete(projects, where: "id = ?", whereArgs: [id]);
    return response;
  }

  @override
  Future<List<Project>> queryOperators() async {
    final _db = await helper.db;
    final response = await _db.query(projects, orderBy: "name");
    if (response.isEmpty) {
      return [];
    } else {
      final List<Project> result = [];
      response
          .map(
            (element) => result.add(
              Project.fromMap(element),
            ),
          )
          .toList();
      // ignore: avoid_print
      print("============= data from repositoryImpl ${result.length}");
      return result;
    }
  }

  @override
  Future<int> updateOperator(int id, Project model) async {
    final _db = await helper.db;
    final result = await _db.update(projects, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }
}
