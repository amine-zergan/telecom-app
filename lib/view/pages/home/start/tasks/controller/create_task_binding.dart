import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateTaskController());
  }
}
