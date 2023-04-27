import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';

abstract class IrepositroyProfileDataSource {
  Future<int> insert(Profile model);
  Future<int> update(Profile model, int id);
  Future<Profile?> fetch();
  Future<int> delete(int id);
}
