import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';

class ConfigBind extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ConfigController(
        repositoryEntreprise: getItInstance(),
        repositoryProfile: getItInstance(),
        repos: getItInstance(),
      ),
    );
  }
}
