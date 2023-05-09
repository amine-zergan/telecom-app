import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_contact_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/site/site_model.dart';
import '../../helpers/db_helper.dart';

class RemoteSiteDataSourceImpl extends IrepositorySiteDatasource {
  @override
  Future<int> insert(Site model) async {
    final db = await DbHelper.instance.db;
    final response = await db.insert(
      site,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  @override
  Future<bool> isExist(String name, int operatorId) async {
    final db = await DbHelper.instance.db;
    final result = await db.rawQuery(
        'SELECT * FROM $site WHERE name=? AND operator=? ', [name, operatorId]);
    // ignore: avoid_print
    print("============ result from db $result ========");
    return result.isNotEmpty;
  }
}
