// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, unused_catch_clause
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:telecom/db/Remote_Data_Source/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_operator_datasource.dart';
import 'package:telecom/db/Remote_Data_Source/project/abstract_project_datasource.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/model/entreprise/entreprise_model.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/utils/converter/base64_encode.dart';

enum StatusData { loading, loaded, initial, error }

class SettingController extends GetxController {
  final IrepositoryEntrepriseSource reposEntreprise;
  final IrepositroyProfileDataSource reposProfile;
  final IrepositoryOperatorDatasource operatorDatasource;
  final IrepositoryProjectDatasource projectDatasource;
  SettingController({
    required this.reposEntreprise,
    required this.reposProfile,
    required this.operatorDatasource,
    required this.projectDatasource,
  });

  Profile? profile;
  StatusData? statusData;
  Uint8List? imageProfile;
  Uint8List? imageEntreprise;
  Entreprise? entreprise;
  List<Operator> dataOperators = [];
  List<Project> dataFromDb = [];

  void imageFromProfile(Profile? data) {
    imageProfile = ImageConvert.decode(data?.image);
    update();
  }

  void imageFromEntreprise(Entreprise? data) {
    imageEntreprise = ImageConvert.decode(data?.logo);
    update();
  }

  @override
  void onInit() {
    queryOperatorFromDatabase();
    queryProjectFromDatabase();
    fetchProfileUser();
    fetchEntreprise();
    super.onInit();
  }

  void queryProjectFromDatabase() async {
    try {
      final List<Project> response = await projectDatasource.queryOperators();
// ignore: avoid_function_literals_in_foreach_calls
      response.map((project) {
        dataFromDb.add(project);
      }).toList();
    } catch (e) {
      print("============= error ${e.toString()}");
      dataFromDb = [];
    }
    update();
  }

  void fetchProfileUser() async {
    try {
      Profile? profil = await reposProfile.fetch();
      profile = profil;
      imageFromProfile(profile);
      update();
    } on Exception catch (error) {
      profile = null;
    }
    update();
  }

  Future<void> queryOperatorFromDatabase() async {
    try {
      final List<Operator> response = await operatorDatasource.queryOperators();
// ignore: avoid_function_literals_in_foreach_calls
      response.map((operator) {
        dataOperators.add(operator);
      }).toList();
      print(
          "============= succes fetch operator dashbord controller ${dataOperators.length}");
    } catch (e) {
      print("============= error ${e.toString()}");
      dataOperators = [];
    }
    update();
  }

  void fetchEntreprise() async {
    try {
      Entreprise? model = await reposEntreprise.fetch();
      entreprise = model;
      imageFromEntreprise(entreprise);
      update();
    } on Exception catch (error) {
      entreprise = null;
    }
    update();
  }
}
