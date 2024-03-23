// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/tasks/abstract_task_datasource.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/model/tasks/task_model.dart';
import 'package:telecom/helpers/utils/formater/time_format.dart';

class CreateTaskController extends GetxController {
  final IrepositoryProjectDatasource repo;
  final IrepositoryOperatorDatasource repositoryOperator;
  final IrepositoryTaskDatasource repositoryTask;
  CreateTaskController(
    this.repo,
    this.repositoryOperator,
    this.repositoryTask,
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<Project> dataFromDb = [];

  List<Operator> dataOperators = [];

  Project? currentProject;
  Operator? currentOperator;
  String? currentRegion;
  String? currentTask;
  String error = "";
  String errorRegion = "";
  int? mission;

  String _dateTask = DateFormat.formDate(
    DateTime.now(),
  );

  String get dateTask => _dateTask;

  /// Function of type [void] to update _dataTask
  ///
  Future<void> updateDateTask(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final DateTime? _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2029),
    );
    if (_date != null) {
      _dateTask = DateFormat.formDate(_date);
      update();
    }
    update();
  }

  /// Function of type [void] to update currentProject and currentOperator
  ///
  void updateOperator(Operator? value) {
    currentOperator = value;
    update();
  }

  void updateRegion(String? value) {
    currentRegion = value;
    errorRegion = "";
    update();
  }

  void updateTask(String? value) {
    currentTask = value;
    update();
  }

  void updateProject(Project? value) {
    currentProject = value;
    update();
  }

  void queryProjectFromDatabase() async {
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

  void queryOperatorFromDatabase() async {
    try {
      final List<Operator> response = await repositoryOperator.queryOperators();
// ignore: avoid_function_literals_in_foreach_calls
      response.map((operator) {
        dataOperators.add(operator);
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print("============= error ${e.toString()}");
      dataOperators = [];
    }
    update();
  }

  /// Function return void Type to insert model [Task] to database and assigned to [mission],
  ///
  void insertTaskToDb() async {
    try {
      if (formKey.currentState!.validate() &&
          currentOperator != null &&
          currentProject != null) {
        if ((await verfieExistTask()) == false) {
          final Task model = Task(
            description: description.text,
            mission: mission,
            project: currentProject!,
            operator: currentOperator!,
            region: currentRegion!,
            date: DateFormat.toDate(_dateTask),
          );
          await repositoryTask.insert(model);
          Get.snackbar(
            "Notification",
            "Tâche crée avec succes",
            backgroundColor: Colors.green.shade200,
            snackPosition: SnackPosition.TOP,
          );

          description.clear();
          error = "";
        } else {
          // ignore: avoid_print
          print("============= error task already exist");
          Get.snackbar(
            "Notification",
            "Tâche deja crée...",
            backgroundColor: Colors.red.shade200,
            snackPosition: SnackPosition.TOP,
          );
          error = "error task already exist";
        }
      } else {
        // ignore: avoid_print

        error = "form invalid";
        if (currentRegion == null) {
          errorRegion = "region required...";
          print("============= region required ======");
          update();
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("============= error ${e.toString()}");
      error = "";
    }
    update();
  }

  Future<bool> verfieExistTask() async {
    final response = await repositoryTask.isExist(_dateTask);
    return response;
  }

  late TextEditingController description;
  late TextEditingController regionController;

  @override
  void onInit() {
    queryProjectFromDatabase();
    queryOperatorFromDatabase();
    description = TextEditingController();
    regionController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    description.dispose();
    regionController.dispose();
    super.onClose();
  }
}
