import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';

abstract class IrepositoryContactDatasource {
  Future<Contact?> insert(Contact model);
  Future<List<Contact>> fetchAll();
  Future<int> update(int id, Contact model);
  Future<bool> verifieExistance(String contact);
  Future<int> delete(int id);
}
