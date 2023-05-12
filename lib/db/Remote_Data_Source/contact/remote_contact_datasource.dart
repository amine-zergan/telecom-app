import 'package:sqflite/sqflite.dart';
import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';

import '../../helpers/db_helper.dart';

class RemoteContactDataSourceImpl extends IrepositoryContactDatasource {
  @override
  Future<int> delete(int id) async {
    final db = await DbHelper.instance.db;
    final response =
        await db.delete(contacts, where: "id = ?", whereArgs: [id]);
    return response;
  }

  @override
  Future<List<Contact>> fetchAll() async {
    final db = await DbHelper.instance.db;
    final response = await db.query(contacts);
    if (response.isEmpty) {
      return [];
    } else {
      final List<Contact> result = [];
      response
          .map(
            (element) => result.add(
              Contact.fromMap(element),
            ),
          )
          .toList();
      return result;
    }
  }

  @override
  Future<int> insert(Contact model) async {
    final db = await DbHelper.instance.db;
    final response = await db.insert(contacts, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return response;
  }

  @override
  Future<int> update(int id, Contact model) async {
    final db = await DbHelper.instance.db;
    final result = await db.update(contacts, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  @override
  Future<bool> verifieExistance(String contact) async {
    final db = await DbHelper.instance.db;
    final response = await db.query(contacts,
        where: "contact=?", whereArgs: [contact], limit: 1);
    return response.isNotEmpty;
  }
}
