import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/auth_pages/signin_page/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthController(),
    );
  }
}
