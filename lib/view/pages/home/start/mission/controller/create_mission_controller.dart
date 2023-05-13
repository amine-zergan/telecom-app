import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/utils/formater/time_format.dart';

class CreateMissionController extends GetxController {
  final IrepositoryMissionDatasource repository;
  CreateMissionController(this.repository);

  String nombreJour = "une semaine";

  bool isEquipe = false;
  bool isDeplacement = false;
  List<String> codeSite = [];
  List<String> membreEquipe = [];

  int carburanat = 1;
  int jourdeplacement = 1;
  String dateDepart = DateFormat.formDate(DateTime.now());
  List<String> jourMission = [
    "un jour",
    "deux jours",
    "trois jours",
    "quatre jours",
    "une semaine",
    "deux semaines"
  ];

  /// Update Functions for variable declaring to injected to Ui components :
  /// ************

  Future<void> updateDateTask(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final DateTime? _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2029),
    );
    if (_date != null) {
      dateDepart = DateFormat.formDate(_date);
      update();
    }
    update();
  }

  /// Function onchangeJour return a [void] type to update nombreJour
  ///
  void onChangeJour(String? value) {
    nombreJour = value!;
    update();
  }

  ///
  /// update is Equipe bool with too Function :
  /// updateTrueValue to set bool = true
  /// updateFalseValue to set bool = false
  ///
  void updatetoggleEquipeTrueValue() {
    isEquipe = true;
    update();
  }

  void updatetoggleEquipeFalseValue() {
    isEquipe = false;
    update();
  }

  /// update is Deplacement bool with too Function :
  void updatetoggleDeplacementTrueValue() {
    isDeplacement = true;
    update();
  }

  void updatetoggleDeplacementFalseValue() {
    isDeplacement = false;
    update();
  }

  /// update ListView : nombreEquipe :
  ///
  void updateNombreEquipeAdd() {
    if (fieldsEquipe.text.isNotEmpty) {
      membreEquipe.add(fieldsEquipe.text);
      fieldsEquipe.clear();
      // ignore: avoid_print
      print("======= activate function ${membreEquipe.length}========");
      update();
    }
  }

  void updateNombreEquipeRemove(int index) {
    membreEquipe.removeAt(index);
    update();
  }

  /// update jour deplacement :
  /// increment jourdeplacement
  /// decrement jour deplacement
  ///

  void updateIncrementJourDeplacement() {
    jourdeplacement++;
    update();
  }

  void updateDecrementJourDeplacement() {
    if (jourdeplacement > 1) {
      jourdeplacement--;
    }
    update();
  }

  /// update code site injected To mission :
  /// add to site code
  /// remouve from site list
  ///
  void updateNombreSiteAdd() {
    if (fieldsNomCodeSite.text.isNotEmpty) {
      codeSite.add(fieldsNomCodeSite.text);
      fieldsEquipe.clear();
    }
    update();
  }

  void updateNombreSiteRemove(int index) {
    codeSite.removeAt(index);
    update();
  }

  /// Fuel For mission
  /// increment or decremeenet for minimum 1 carburant must add to mission
  ///
  void updateIncrementCarburant() {
    carburanat++;
    update();
  }

  void updateDecrementCarburant() {
    if (carburanat > 1) {
      carburanat--;
    }
    update();
  }

  /// Variables for TextEditingController :
  ///
  late TextEditingController fieldsEquipe;
  late TextEditingController fieldsFraisDeplacement;
  late TextEditingController fieldsNomCodeSite;
  late TextEditingController fieldsIndexDepart;
  late TextEditingController fieldsVehicule;

  @override
  void onInit() {
    fieldsEquipe = TextEditingController();
    fieldsFraisDeplacement = TextEditingController();
    fieldsNomCodeSite = TextEditingController();
    fieldsIndexDepart = TextEditingController();
    fieldsVehicule = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fieldsEquipe.dispose();
    fieldsFraisDeplacement.dispose();
    fieldsIndexDepart.dispose();
    fieldsNomCodeSite.dispose();
    fieldsVehicule.dispose();
    super.onClose();
  }
}
