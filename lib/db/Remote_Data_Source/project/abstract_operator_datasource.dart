import 'package:telecom/model/components/project/operator_model.dart';

abstract class IrepositoryOperatorDatasource {
  Future<int> addOperator(Operator model);
  Future<List<Operator>> queryOperators();
  Future<int> updateOperator(int id, Operator model);
  Future<int> deleteOperator(int id);
}
