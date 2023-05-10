import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/model/components/project/project_model.dart';

class CreateTaskController extends GetxController {
  final IrepositoryProjectDatasource repo;

  CreateTaskController(this.repo);

  List<Project> dataFromDb = [];

  void fetchDataFromDb() async {
    try {
      final List<Project> response = await repo.queryOperators();
// ignore: avoid_function_literals_in_foreach_calls
      response.map((project) {
        dataFromDb.add(project);
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print("============= error ${e.toString()}");
      dataFromDb = [];
    }
    update();
  }

  @override
  void onInit() {
    fetchDataFromDb();
    super.onInit();
  }
}
