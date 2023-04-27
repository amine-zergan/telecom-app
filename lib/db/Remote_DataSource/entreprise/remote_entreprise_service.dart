// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';

import 'package:telecom/db/Remote_DataSource/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/helpers/db_helper.dart';
import 'package:telecom/model/entreprise/entreprise_model.dart';

class RemoteEntrepriseDataSourceImpl extends IrepositiryEntrepriseSource {
  // ignore: unused_field
  final Database _db;
  DbHelper dbHelper;
  RemoteEntrepriseDataSourceImpl({
    required Database db,
    required this.dbHelper,
  }) : _db = db;
  @override
  Future<int> delete(int id) async {
    final result =
        await _db.delete(entreprises, where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Future<Entreprise?> fetch() async {
    List<Map<String, Object?>> result = await _db.query(entreprises);
    if (result.isEmpty) return null;
    final response = Entreprise.fromMap(result.first);
    return response;
  }

  @override
  Future<int> insert(Entreprise model) async {
    return _db.insert(
      entreprises,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> update(Entreprise model, int id) async {
    final result = await _db
        .update(entreprises, model.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Stream<Entreprise?> watch() async* {
    final result = await fetch();
    yield result;
  }
}
