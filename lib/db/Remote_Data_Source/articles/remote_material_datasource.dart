// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sql.dart';

import 'package:telecom/db/Remote_Data_Source/articles/abstract_material_datasource.dart';

import '../../../model/components/article/material_model.dart';
import '../../helpers/db_helper.dart';

class RemoteMaterialDataSourceImpl extends IrepositoryMaterialDataSource {
  final DbHelper hepler;
  RemoteMaterialDataSourceImpl({
    required this.hepler,
  });
  @override
  Future<int> insert(Equipement model) async {
    final db = await hepler.db;
    final response = await db.insert("equipements", model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  @override
  Future<bool> verifieExistance(String ref) async {
    final db = await hepler.db;
    final response = await db.query("equipements",
        where: "ref=?", whereArgs: [ref], limit: 1);
    return response.isNotEmpty;
  }
}
