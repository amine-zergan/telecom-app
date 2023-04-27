import 'package:telecom/model/entreprise/entreprise_model.dart';

abstract class IrepositiryEntrepriseSource {
  Future<int> insert(Entreprise model);
  Future<Entreprise?> fetch();
  Future<int> update(Entreprise model, int id);
  Future<int> delete(int id);
  Stream<Entreprise?> watch();
}
