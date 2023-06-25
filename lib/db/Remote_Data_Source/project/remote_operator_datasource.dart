// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';

import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/components/project/operator_model.dart';

class RemoteOperatorDataSourceImpl extends IrepositoryOperatorDatasource {
  final DbHelper helper;
  RemoteOperatorDataSourceImpl({
    required this.helper,
  });
  @override
  Future<int> addOperator(Operator model) async {
    final db = await helper.db;
    final response = await db.insert(operators, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  @override
  Future<int> deleteOperator(int id) async {
    final db = await helper.db;
    final response =
        await db.delete(operators, where: "id = ?", whereArgs: [id]);
    return response;
  }

  @override
  Future<List<Operator>> queryOperators() async {
    final db = await helper.db;
    final response = await db.query(operators);
    if (response.isEmpty) {
      return [];
    } else {
      final List<Operator> result = [];
      response
          .map(
            (element) => result.add(
              Operator.fromMap(element),
            ),
          )
          .toList();
      return result;
    }
  }

  @override
  Future<int> updateOperator(int id, Operator model) async {
    final db = await helper.db;
    final result = await db.update(operators, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }
}
