import 'package:telecom/model/mission/mission_model.dart';

abstract class IrepositoryMissionDatasource {
  Future<int> insert(Mission model);
  Future<List<Mission>> fetchAll();
  Future<List<Mission>> fetchIncomplited();
  Future<Mission?> detailsMission(int id);
  Future<int> update(int id, Mission model);
  Future<bool> verifieExistance(String started, String? finished);
  Future<int> delete(int id);
}
