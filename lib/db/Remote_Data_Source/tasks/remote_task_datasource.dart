import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/Remote_Data_Source/tasks/abstract_task_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/tasks/task_model.dart';

class RemoteTaskDataSourceImpl extends IrepositoryTaskDatasource {
  @override
  Future<int> insert(Task model) async {
    final db = await DbHelper.instance.db;
    final response = await db.insert(
      tasks,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  @override
  Future<bool> isExist(String date) async {
    final db = await DbHelper.instance.db;
    final response = await db.query(
      tasks,
      where: "date=?",
      whereArgs: [date],
      limit: 1,
    );
    // ignore: avoid_print
    print("============= response query==========");
    // ignore: avoid_print
    print(response);
    return response.isNotEmpty;
  }
}
