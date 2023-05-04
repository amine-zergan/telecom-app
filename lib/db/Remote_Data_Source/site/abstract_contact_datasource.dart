import '../../../model/site/site_model.dart';

abstract class IrepositorySiteDatasource {
  Future<int> insert(Site model);
  Future<bool> isExist(String name, int operatorId);
}
