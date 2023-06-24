import 'package:telecom/model/tasks/task_model.dart';

abstract class IrepositoryTaskDatasource {
  Future<int> insert(Task model);
  Future<bool> isExist(String date);
  Future<List<Task>> fetchForMission(String started, String finished);
}
