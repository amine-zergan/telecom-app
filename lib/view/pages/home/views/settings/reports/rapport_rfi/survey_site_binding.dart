import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/survey_site_controller.dart';

class SurveySiteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SurveySiteController());
  }
}
