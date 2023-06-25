import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/pages/home/controller/home_controller.dart';
import 'package:telecom/view/pages/home/dashbord/controller/dashbord_controller.dart';
import 'package:telecom/view/pages/home/navigation/controllers/navigation_Controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ContactController(getItInstance()));
    Get.put(
      NavigagtionController(
        getItInstance(),
      ),
    );
    Get.put(DashboardController());
  }
}
