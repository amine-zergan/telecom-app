import '../../../model/site/site_model.dart';

abstract class IrepositorySiteDatasource {
  Future<int> insert(Site model);
  Future<bool> isExist(String name, int operatorId);
  Future<List<Site>> queryall();
  Future<List<Site>> queryByOperator(int operator);
  Future<int> deleteSite(int id);
  Future<void> deleteAll();
}
