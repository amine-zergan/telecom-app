// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, unused_catch_clause
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:telecom/db/Remote_Data_Source/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/model/entreprise/entreprise_model.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/utils/converter/base64_encode.dart';

enum StatusData { loading, loaded, initial, error }

class SettingController extends GetxController {
  final IrepositoryEntrepriseSource reposEntreprise;
  final IrepositroyProfileDataSource reposProfile;
  SettingController({
    required this.reposEntreprise,
    required this.reposProfile,
  });

  Profile? profile;
  StatusData? statusData;
  Uint8List? imageProfile;
  Uint8List? imageEntreprise;
  Entreprise? entreprise;

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
    fetchProfileUser();
    fetchEntreprise();
    super.onInit();
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
