import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/components/project/project_model.dart';

class RemoteProjectDataSourceImpl extends IrepositoryProjectDatasource {
  @override
  Future<int> addOperator(Project model) async {
    final db = await DbHelper.instance.db;
    final response = await db.insert(projects, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  @override
  Future<int> deleteOperator(int id) async {
    final db = await DbHelper.instance.db;
    final response =
        await db.delete(projects, where: "id = ?", whereArgs: [id]);
    return response;
  }

  @override
  Future<List<Project>> queryOperators() async {
    final db = await DbHelper.instance.db;
    final response = await db.query(projects, orderBy: "name");
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
    final db = await DbHelper.instance.db;
    final result = await db.update(projects, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }
}
