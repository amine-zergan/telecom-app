import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/survey_site_controller.dart';

// route page : GetPage(binding: Survey)
class SurveySiteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SurveySiteController(
        getItInstance(), // package get_it
        Get.find(), // getx
      ),
    );
  }
}
