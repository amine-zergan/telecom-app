import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_controller.dart';

class PvReceptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PvReceptionController(
        getItInstance(),
      ),
    );
  }
}
