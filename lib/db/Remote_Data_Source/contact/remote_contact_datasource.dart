// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';

import 'package:telecom/db/Remote_Data_Source/contact/abstract_contact_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';
import 'package:telecom/model/entreprise/profile_and_contact/filter_model.dart';

import '../../helpers/db_helper.dart';

class RemoteContactDataSourceImpl extends IrepositoryContactDatasource {
  final DbHelper hepler;
  RemoteContactDataSourceImpl({
    required this.hepler,
  });
  @override
  Future<int> delete(int id) async {
    final db = await hepler.db;
    final response =
        await db.delete(contacts, where: "id = ?", whereArgs: [id]);
    return response;
  }

  @override
  Future<List<Contact>> fetchAll(FilterContact? model) async {
    final db = await hepler.db;

    final response = await db.query(contacts,
        orderBy: model?.contact ?? "name",
        limit: model?.slider == null ? 30 : model?.slider!.toInt());
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
  Future<Contact?> insert(Contact model) async {
    final db = await hepler.db;
    final response = await db.insert(contacts, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    final result = await db.query(contacts,
        where: "contact=?", whereArgs: [model.contact], limit: 1);
    if (result.isNotEmpty && response != 0) {
      Contact contact = Contact.fromMap(result.first);
      return contact;
    } else {
      return null;
    }
  }

  @override
  Future<int> update(int id, Contact model) async {
    final db = await hepler.db;
    final result = await db.update(contacts, model.toMap(),
        where: "id=?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  @override
  Future<bool> verifieExistance(String contact) async {
    final db = await hepler.db;
    final response = await db.query(contacts,
        where: "contact=?", whereArgs: [contact], limit: 1);
    return response.isNotEmpty;
  }
}
