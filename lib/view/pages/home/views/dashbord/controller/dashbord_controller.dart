// ignore_for_file: unnecessary_overrides, avoid_print, unused_local_variable

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/tasks/abstract_task_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/model/mission/mission_model.dart';

class DashboardController extends GetxController {
  final IrepositoryMissionDatasource missionRepository;
  final IrepositoryTaskDatasource taskDatasource;
  final IrepositoryOperatorDatasource operatorDatasource;
  final IrepositoryProjectDatasource projectDatasource;
  final IrepositroyProfileDataSource profileDataSource;

  DashboardController(
      {required this.missionRepository,
      required this.operatorDatasource,
      required this.taskDatasource,
      required this.profileDataSource,
      required this.projectDatasource});

  Mission? mission;
  Profile? user;

  fetchCurrentMission() async {
    try {
      final value = await missionRepository.fetchIncomplited();
      print("======== current mission from dashboard $value ===========");
    } catch (e) {
      print("======== error mission from db ${e.toString()} ===========");
    }
  }

  void getUser() async {
    final response = await profileDataSource.fetch();
    user = response;
    print("user fetched with success $user ");
    update();
  }

  @override
  void onInit() {
    fetchCurrentMission();
    getUser();
    super.onInit();
  }
}
