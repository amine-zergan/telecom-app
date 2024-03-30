import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';

class CreateSiteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CreateSiteController(
        repositoryOperator: getItInstance(),
        navigationController: Get.find(),
        repositorySite: getItInstance(),
      ),
    );
  }
}
