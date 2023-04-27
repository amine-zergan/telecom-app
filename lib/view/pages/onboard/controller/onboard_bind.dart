import 'package:get/get.dart';
import 'package:telecom/view/pages/onboard/controller/onboard_controller.dart';

class OnboardBind extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardController());
  }
}
