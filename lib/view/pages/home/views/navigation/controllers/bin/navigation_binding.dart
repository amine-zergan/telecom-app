import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      NavigationController(
        repository: getItInstance(),
      ),
    );
  }
}
