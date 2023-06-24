import 'package:get/get.dart';
import 'package:telecom/view/pages/home/controller/home_controller.dart';
import 'package:telecom/view/pages/home/dashbord/controller/dashbord_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(DashboardController());
  }
}
