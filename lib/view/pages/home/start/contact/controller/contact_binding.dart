import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/contact/controller/contact_controller.dart';

class Contactbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactController());
  }
}
