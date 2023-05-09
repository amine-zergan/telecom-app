import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';

class CreateMissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateMissionController());
    //Get.lazyPut(() => CreateMissionController());
  }
}
