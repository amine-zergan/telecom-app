import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/start/equipements/controller/create_equipement_controller.dart';

class CreateEquipementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CreateEquipementController(
        getItInstance(),
        getItInstance(),
      ),
    );
  }
}
