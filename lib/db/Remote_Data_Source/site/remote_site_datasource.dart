// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_brace_in_string_interps
// ignore_for_file: avoid_print

import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/site/site_model.dart';

import '../../helpers/db_helper.dart';

class RemoteSiteDataSourceImpl extends IrepositorySiteDatasource {
  final DbHelper helper;
  RemoteSiteDataSourceImpl({
    required this.helper,
  });
  @override
  Future<int> insert(Site model) async {
    final db = await helper.db;
    final response = await db.insert(
      site,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return response;
  }

  @override
  Future<bool> isExist(String name, int operatorId) async {
    final db = await helper.db;

    final result = await db.rawQuery(
      'SELECT * FROM sites WHERE sites.name=? AND sites.operator=?  ',
      [name, operatorId],
    );

    print("============ result from db $result ========");

    return result.isNotEmpty;
  }

  @override
  Future<List<Site>> queryall() async {
    final db = await helper.db;

    final response = await db.rawQuery("""
SELECT * FROM sites INNER JOIN operators ON sites.operator=operators.idOperator  
""");

    if (response.isEmpty) {
      return [];
    } else {
      final List<Site> result = [];
      response.map((element) {
        result.add(Site.fromMap(element));
      }).toList();
      print("============ result transaction ${result} ========");
      return result;
    }
  }

  @override
  Future<List<Site>> queryByOperator(int operator) {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteSite(int id) {
    throw UnimplementedError();
  }
}
