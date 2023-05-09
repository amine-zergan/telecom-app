import 'package:telecom/model/components/project/project_model.dart';

abstract class IrepositoryProjectDatasource {
  Future<int> addOperator(Project model);
  Future<List<Project>> queryOperators();
  Future<int> updateOperator(int id, Project model);
  Future<int> deleteOperator(int id);
}
