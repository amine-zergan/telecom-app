// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:get/get.dart';

import 'package:telecom/db/Remote_Data_Source/entreprise/abstract_entreprise_service.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/model/entreprise/entreprise_model.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';

class SettingController extends GetxController {
  final IrepositoryEntrepriseSource reposEntreprise;
  final IrepositroyProfileDataSource reposProfile;
  SettingController({
    required this.reposEntreprise,
    required this.reposProfile,
  });

  Profile? profile;
  Entreprise? entreprise;

  @override
  void onInit() {
    fetchProfileUser();
    fetchEntreprise();
    super.onInit();
  }

  void fetchProfileUser() async {
    Profile? profil = await reposProfile.fetch();
    profile = profil;
    print("============== profile fetched from db $profile");

    update();
  }

  void fetchEntreprise() async {
    Entreprise? model = await reposEntreprise.fetch();
    entreprise = model;
    print("============== entreprise fetched from db $entreprise");
    update();
  }
}
