import 'package:telecom/model/components/article/material_model.dart';

abstract class IrepositoryMaterialDataSource {
  Future<int> insert(Equipement model);
  Future<bool> verifieExistance(String ref);
}
