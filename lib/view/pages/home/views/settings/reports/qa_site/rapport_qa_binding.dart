import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qa_controller.dart';

class RapportQaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      QaController(),
    );
  }
}
