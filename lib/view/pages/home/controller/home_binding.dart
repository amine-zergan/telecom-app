import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/pages/home/controller/home_controller.dart';
import 'package:telecom/view/pages/home/views/dashbord/controller/dashbord_controller.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';
import 'package:telecom/view/pages/home/views/settings/controller/setting_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
    );
    Get.put(
      ContactController(
        getItInstance(),
        getItInstance(),
      ),
    );
    Get.put(
      NavigationController(
        repository: getItInstance(),
      ),
    );
    Get.put(
      SettingController(
        reposEntreprise: getItInstance(),
        reposProfile: getItInstance(),
      ),
    );
    Get.put(
      DashboardController(
        missionRepository: getItInstance(),
      ),
    );
  }
}
