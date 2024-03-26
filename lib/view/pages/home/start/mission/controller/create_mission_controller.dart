// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/mission/abstract_mission_datasource.dart';
import 'package:telecom/db/helpers/constant_db.dart';
import 'package:telecom/model/mission/mission_model.dart';

import 'package:telecom/helpers/utils/converter/enum/status_mission.dart';
import 'package:telecom/helpers/utils/formater/time_format.dart';

class CreateMissionController extends GetxController {
  final IrepositoryMissionDatasource repository;
  CreateMissionController(this.repository);

  int nombreJour = 1;

  bool isEquipe = false;
  bool isDeplacement = false;
  List<String> codeSite = [];
  List<String> membreEquipe = [];

  int carburant = 1;
  int jourdeplacement = 1;
  String dateDepart = DateFormat.formDate(
    DateTime.now(),
  );

  String? finished;

  List<String> jourMission = [
    "un jour",
    "deux jours",
    "trois jours",
    "quatre jours",
    "une semaine",
    "deux semaines"
  ];

  DateTime startedDateMission = DateTime.now();
  DateTime? finishedDateMission;

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    startedDateMission = focusedDay;
    finishedDateMission = selectedDay;
    print("**** selected started date $startedDateMission *************");
    print("**** selected finished date $finishedDateMission *************");
    update();
  }

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
  void onChangeJour(int? value) {
    nombreJour = value!;
    finished = DateFormat.formDate(
      DateFormat.addDuration(dateDepart, nombreJour),
    );
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
    if (fieldsEquipe.text.isNotEmpty &&
        !membreEquipe.contains(fieldsEquipe.text)) {
      membreEquipe.add(fieldsEquipe.text);
      fieldsEquipe.clear();
    }
    update();
  }

  void updateNombreEquipeRemove(int index) {
    membreEquipe.removeAt(index);
    update();
  }

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
    if (fieldsNomCodeSite.text.isNotEmpty &&
        !codeSite.contains(fieldsNomCodeSite.text.toUpperCase())) {
      codeSite.add(fieldsNomCodeSite.text.toUpperCase());
      fieldsNomCodeSite.clear();
      update();
    }
  }

  void updateNombreSiteRemove(int index) {
    codeSite.removeAt(index);
    update();
  }

  /// Fuel For mission
  /// increment or decremeenet for minimum 1 carburant must add to mission
  ///
  void updateIncrementCarburant() {
    carburant++;
    update();
  }

  void updateDecrementCarburant() {
    if (carburant > 1) {
      carburant--;
    }
    update();
  }

  /// verify Existance of Mission opened yet in Database :
  /// date started with estimation date means :
  /// in periode of [started]-[finished] date in query database
  ///

  Future<bool> isExistMission() async {
    final response = await repository.verifieExistance(dateDepart, finished);
    return response;
  }

  Future<void> insertMissionToDb() async {
    try {
      if (transportKey.currentState!.validate() || codeSite.isNotEmpty) {
        if ((await isExistMission()) == false) {
          final Mission model = Mission(
            started: dateDepart,
            finished: finished,
            deplacement: isDeplacement,
            equipe: isEquipe,
            depense: false,
            bon: carburant,
            carburant: 0,
            status: Status.pending,
            depart: double.parse(fieldsIndexDepart.text),
            car: fieldsVehicule.text,
            chefequipe: fieldsSupervisseur.text,
            chefprojet: fieldsChefProjet.text,
            peage: 0,
            achat: 0,
          );
          final response = await repository.insert(model);

          print("===== succes formating mission $response==========");
          Get.snackbar(
            "Notification",
            "Mission crée avec succes",
            backgroundColor: Colors.green.shade300,
            snackPosition: SnackPosition.TOP,
          );
        } else {
          print("===== code site  est obligatoire ==========");
          Get.snackbar(
            "Notification",
            "Il y a une Mission ouvert deja. essaier de cloturer pour creer une nouvelle. ",
            backgroundColor: Colors.red.shade200,
            snackPosition: SnackPosition.TOP,
          );
        }
      } else {
        Get.snackbar(
          "Notification",
          "Il n'y a aucune site . merci d'ajouter les sites de destinations ",
          backgroundColor: Colors.red.shade200,
          snackPosition: SnackPosition.TOP,
        );
        print(
            "===== invalid : mission ouvert deja merci de cloturer vos missions ==========");
      }
    } catch (e) {
      print("===================== error :${e.toString()} =========");
    }
  }

  /// Variables for TextEditingController :
  ///
  late TextEditingController fieldsEquipe;
  late TextEditingController fieldsFraisDeplacement;
  late TextEditingController fieldsNomCodeSite;
  late TextEditingController fieldsIndexDepart;
  late TextEditingController fieldsVehicule;
  late TextEditingController fieldsChefProjet;
  late TextEditingController fieldsSupervisseur;
  GlobalKey<FormState> transportKey = GlobalKey();
  GlobalKey<FormState> deplacementKey = GlobalKey();

  @override
  void onInit() {
    fieldsEquipe = TextEditingController();
    fieldsFraisDeplacement = TextEditingController();
    fieldsNomCodeSite = TextEditingController();
    fieldsIndexDepart = TextEditingController();
    fieldsVehicule = TextEditingController();
    fieldsChefProjet = TextEditingController();
    fieldsSupervisseur = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fieldsEquipe.dispose();
    fieldsFraisDeplacement.dispose();
    fieldsIndexDepart.dispose();
    fieldsNomCodeSite.dispose();
    fieldsVehicule.dispose();
    fieldsChefProjet.dispose();
    fieldsSupervisseur.dispose();
    super.onClose();
  }
}
