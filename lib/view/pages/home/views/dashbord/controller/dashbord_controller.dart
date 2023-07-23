// ignore_for_file: unnecessary_overrides, avoid_print, unused_local_variable

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/model/mission/mission_model.dart';

class DashboardController extends GetxController {
  final IrepositoryMissionDatasource missionRepository;

  DashboardController({required this.missionRepository});

  Mission? mission;

  fetchCurrentMission() async {
    try {
      final value = await missionRepository.fetchIncomplited();
    } catch (e) {
      print("======== error mission from db ${e.toString()} ===========");
    }
  }

  @override
  void onInit() {
    fetchCurrentMission();
    super.onInit();
  }
}
