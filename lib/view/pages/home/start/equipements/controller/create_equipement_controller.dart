import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/components/project/project_model.dart';

import 'package:telecom/utils/converter/enum/indoor_outdoor_enum.dart';
import 'package:telecom/view/pages/home/start/tasks/data/data_project.dart';
import '../../../../../../db/Remote_Data_Source/articles/abstract_material_datasource.dart';
import '../../../../../../model/components/article/material_model.dart';

class CreateEquipementController extends GetxController {
  final IrepositoryMaterialDataSource repository;
  final IrepositoryProjectDatasource repositoryProject;
  CreateEquipementController(this.repository, this.repositoryProject);

  late TextEditingController fieldsNom;
  late FocusNode nom;
  late TextEditingController fieldsReference;
  late FocusNode reference;
  late TextEditingController fieldsDescription;
  late FocusNode description;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Qualification groupValuePosition = Qualification.indoor;

  int? selectedProject;
  String error = "";
  Project? project;

  List<Project> dataProject = dataProjects;

  List<Project> dataFromDb = [];

  /// Function of Type [void] to update value in ListRadioTile
  /// for update value of Type Qualification Equipement

  void onChanged(Qualification? value) {
    groupValuePosition = value!;
    update();
  }

  ///
  ///
  void onChangedValue(int index) {
    selectedProject = index;
    project = dataProject[index];
    // ignore: avoid_print
    print(project);
    update();
  }

  /// Function return Type [void] for insert model [Equipement ] saved to Table [equipements] in db
  ///
  Future<void> insertEquipementToDatabase() async {
    try {
      if (formKey.currentState!.validate() == true) {
        if ((await verifieEquipement(fieldsReference.text)) == true) {
          // ignore: avoid_print
          print("=========== equipement deja exist ===========");
          error = "reference deja existe";
        } else {
          final model = Equipement(
            name: fieldsNom.text.toUpperCase(),
            ref: fieldsReference.text,
            description: fieldsDescription.text.toUpperCase(),
            type: groupValuePosition,
            project: project!,
          );
          final result = await repository.insert(model);
          error = "";
          // ignore: avoid_print
          print(
              "=========== equipement insert with  succes $result ===========");
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print("=========== error ${e.toString()}===========");
      error = "Equipement n'est pas enregistrer !";
    }
    update();
  }

  /// Function verifie Existance reference equipmenent to Database
  /// return type [bool]

  Future<bool> verifieEquipement(String ref) async {
    final bool response = await repository.verifieExistance(ref);
    return response;
  }

  /// Function for fetching List project from Database
  /// will return [List<Project>]
  ///

  void fetchDataFromDb() async {
    try {
      final List<Project> response = await repositoryProject.queryOperators();
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
    super.onInit();
    fetchDataFromDb();
    fieldsNom = TextEditingController();
    fieldsReference = TextEditingController();
    fieldsDescription = TextEditingController();
    nom = FocusNode();
    reference = FocusNode();
    description = FocusNode();
  }

  @override
  void onClose() {
    fieldsNom.dispose();
    fieldsReference.dispose();
    fieldsDescription.dispose();
    nom.dispose();
    reference.dispose();
    description.dispose();
  }
}
