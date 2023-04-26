// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/db/sources/entreprise_data_source/abstract_entreprise_service.dart';
import 'package:telecom/model/entreprise/entreprise_model.dart';

class RemoteEntrepriseDataSourceImpl extends IrepositiryEntrepriseSource {
  final Database db;
  RemoteEntrepriseDataSourceImpl({
    required this.db,
  });
  @override
  Future<int> delete(int id) async {
    final result =
        await db.delete(entreprises, where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Future<Entreprise?> fetch() async {
    List<Map<String, Object?>> result = await db.query(entreprises);
    if (result.isEmpty) return null;
    final response = Entreprise.fromMap(result.first);
    return response;
  }

  @override
  Future<int> insert(Entreprise model) async {
    return db.insert(
      entreprises,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> update(Entreprise model, int id) async {
    final result = await db
        .update(entreprises, model.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Stream<Entreprise?> watch() async* {
    final result = await fetch();
    yield result;
  }
}
