// ignore_for_file: unnecessary_overrides, avoid_print

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
      print("========== mission incomplit with succes $value ===========");
    } catch (e) {
      print("======== error from db ${e.toString()} ===========");
    }
  }

  @override
  void onInit() {
    fetchCurrentMission();
    super.onInit();
  }
}
