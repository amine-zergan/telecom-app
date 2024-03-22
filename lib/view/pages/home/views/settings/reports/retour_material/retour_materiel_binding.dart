import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/settings/reports/retour_material/retour_materiel_controller.dart';

class RetourMaterileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      RetourMaterielController(
      setting: Get.find(),
    ));
  }
}
