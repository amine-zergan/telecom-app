// ignore_for_file: unnecessary_overrides, avoid_print, unused_local_variable

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/tasks/abstract_task_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/model/mission/mission_model.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/tasks/task_model.dart';

// ChangeNotifier
class DashboardController extends GetxController {
  final IrepositoryMissionDatasource missionRepository;
  final IrepositoryTaskDatasource taskDatasource;
  final IrepositoryOperatorDatasource operatorDatasource;
  final IrepositoryProjectDatasource projectDatasource;
  final IrepositroyProfileDataSource profileDataSource;

  DashboardController({
    required this.missionRepository,
    required this.operatorDatasource,
    required this.taskDatasource,
    required this.profileDataSource,
    required this.projectDatasource,
  });

  Mission? mission;
  Profile? user;
  List<Operator> dataOperators = [];
  List<Task> completeTask = [];
  List<Task> incomplitTask = [];
  List<Mission> missions = [];

  fetchCurrentMission() async {
    try {
      final result = await missionRepository.fetchIncomplited();
      if (result.isNotEmpty) {
        result.map((e) => missions.add(e)).toList();
      }
      print("======== current mission from dashboard $result ===========");
    } catch (e) {
      print("======== error mission from db ${e.toString()} ===========");
    }
  }

  Future<void> queryOperatorFromDatabase() async {
    try {
      final List<Operator> response = await operatorDatasource.queryOperators();
// ignore: avoid_function_literals_in_foreach_calls
      response.map((operator) {
        dataOperators.add(operator);
      }).toList();
      print(
          "============= succes fetch operator dashbord controller ${dataOperators.length}");
    } catch (e) {
      print("============= error ${e.toString()}");
      dataOperators = [];
    }
    update(); //
  }

  void getUser() async {
    final response = await profileDataSource.fetch();
    user = response;
    print("user fetched with success $user ");
    update();
  }

  @override
  void onInit() {
    queryOperatorFromDatabase();
    fetchCurrentMission();
    getUser();
    super.onInit();
  }
}
