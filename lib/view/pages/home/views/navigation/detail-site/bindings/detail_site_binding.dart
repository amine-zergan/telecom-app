import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/navigation/detail-site/views/controllers/detail_site_controller.dart';

class DetailSiteBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailSiteController(
      navigationConttroller: Get.find(),
    ));
  }
}
