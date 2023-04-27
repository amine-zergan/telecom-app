// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/helpers/constant_db.dart';

import 'package:telecom/db/Remote_DataSource/profile/abstract_profile_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';

class RemoteProfileDataSourceImpl extends IrepositroyProfileDataSource {
  final Database db;
  RemoteProfileDataSourceImpl({
    required this.db,
  });

  @override
  Future<int> delete(int id) async {
    final response = await db.delete(profile, where: "id = ?", whereArgs: [id]);
    return response;
  }

  @override
  Future<Profile?> fetch() async {
    final result = await db.query(profile);
    if (result.isEmpty) return null;
    final response = Profile.fromMap(result.first);
    return response;
  }

  @override
  Future<int> insert(Profile model) async {
    final response = await db.insert(profile, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  @override
  Future<int> update(Profile model, int id) async {
    final result = await db.update(profile, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }
}
