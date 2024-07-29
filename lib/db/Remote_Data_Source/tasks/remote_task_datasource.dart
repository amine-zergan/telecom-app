// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';

import 'package:telecom/db/Remote_Data_Source/tasks/abstract_task_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/tasks/task_model.dart';

class RemoteTaskDataSourceImpl extends IrepositoryTaskDatasource {
  final DbHelper helper;
  RemoteTaskDataSourceImpl({
    required this.helper,
  });
  @override
  Future<int> insert(Task model) async {
    final db = await helper.db;
    final response = await db.insert(
      tasks,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  @override
  Future<bool> isExist(String date) async {
    final db = await helper.db;
    final response = await db.query(
      tasks,
      where: "date=?",
      whereArgs: [date],
      limit: 1,
    );
    return response.isNotEmpty;
  }

  @override
  Future<List<Task>> fetchTaskForMission(
      String started, String finished) async {
    final db = await helper.db;
    final response = await db.rawQuery("""
    SELECT * FROM tasks WHERE tasks.date BETWEEN  started=? AND finished=?
""", [started, finished]);
    if (response.isEmpty) {
      return [];
    } else {
      List<Task> tasks = [];
      response
          .map(
            (e) => tasks.add(
              Task.fromMap(e),
            ),
          )
          .toList();
      return tasks;
    }
  }

  @override
  Future<List<Task>> fetchTaskPending() async {
    List<Task> tasks = [];
    final db = await helper.db;

    List<Map<String, Object?>> response = await db.rawQuery("""
    SELECT * 
FROM tasks
INNER JOIN operators ON operators.idOperator = tasks.operator
INNER JOIN projects ON projects.id = tasks.project
WHERE tasks.isCompleted = 0
""");
    print("=========== query data source  response $response ================");
    response.map((e) => tasks.add(Task.fromMap(e))).toList();
    print("=========== query data source $tasks ================");
    return tasks;
  }
}
