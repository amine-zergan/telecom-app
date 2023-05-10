// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/utils/formater/time_format.dart';

class CreateTaskController extends GetxController {
  final IrepositoryProjectDatasource repo;
  final IrepositoryOperatorDatasource repositoryOperator;
  CreateTaskController(
    this.repo,
    this.repositoryOperator,
  );

  List<Project> dataFromDb = [];

  List<Operator> dataOperators = [];

  Project? currentProject;
  Operator? currentOperator;
  String? currentRegion;

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
    // ignore: avoid_print
    print("============= update currentOperator $currentOperator");
    update();
  }

  void updateRegion(String? value) {
    currentRegion = value;
    // ignore: avoid_print
    print("============= update currentOperator $currentRegion");
    update();
  }

  void updateProject(Project? value) {
    currentProject = value;
    // ignore: avoid_print
    print("============= update currentProject $currentProject");
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
  void insertTaskToDb() {}

  late TextEditingController description;

  @override
  void onInit() {
    queryProjectFromDatabase();
    queryOperatorFromDatabase();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    description.dispose();
    super.onClose();
  }
}
