import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_demontage/pv_demontage_controller.dart';

class PvDemontageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PvDemontageController(
        reposProfile: getItInstance(),
      ),
    );
  }
}
