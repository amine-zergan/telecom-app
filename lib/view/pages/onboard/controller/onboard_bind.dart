import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/onboard/controller/onboard_controller.dart';

class OnboardBind extends Bindings {
  /// class OnBoardBind create instance of class [OnBoardController]
  /// and it maintain al lifecycle of this class[initialise -close]
  /// di ::
  @override
  void dependencies() {
    Get.put(
      OnBoardController(
        getItInstance(),
      ),
    );
  }
}
