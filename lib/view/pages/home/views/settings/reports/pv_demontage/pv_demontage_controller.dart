// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_overrides
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/report/pv_desinstall.dart';

class PvDemontageController extends GetxController {
// injection of Service class :
  final IrepositroyProfileDataSource reposProfile;

// generate constructor
  PvDemontageController({
    required this.reposProfile,
  });
// declaration of variables
  Profile? user;
  GlobalKey<FormState> formvalidation = GlobalKey<FormState>();
  late TextEditingController societeField;
  late TextEditingController addressField;
  late TextEditingController responsableField;
  late TextEditingController contactField;
  late TextEditingController routeurField;
  late TextEditingController antenneField;
  late TextEditingController coaxialField;
  late TextEditingController iduField;
  late TextEditingController radioField;
  late FocusNode societe;
  late FocusNode address;
  late FocusNode responsable;
  late FocusNode contact;
  late FocusNode routeur;
  late FocusNode antenne;
  late FocusNode coaxial;
  late FocusNode idu;
  late FocusNode radio;
// methodes and implementations

  void getUser() async {
    final response = await reposProfile.fetch();
    user = response;
    print("user fetched with success $user ");
    update();
  }

  Future<void> generatePvReception() async {
    try {
      final file = await PvDesInstall.generatePdf(
          technicien: user?.name ?? "",
          contact: user?.phone ?? "",
          b2b: societeField.text,
          address: addressField.text,
          responsable: responsableField.text,
          contactClient: contactField.text,
          materiels: [
            antenneField.text,
            radioField.text,
            routeurField.text,
            coaxialField.text,
            iduField.text,
            "redresseur -48V"
          ]);
      await OpenFile.open(file.path);
    } catch (e) {
      print("erreur : impossible de generer le PDF ");
    }
  }

  @override
  void onInit() {
    getUser();
    societeField = TextEditingController();
    addressField = TextEditingController();
    responsableField = TextEditingController();
    contactField = TextEditingController();
    routeurField = TextEditingController();
    antenneField = TextEditingController();
    coaxialField = TextEditingController();
    iduField = TextEditingController();
    radioField = TextEditingController();
    societe = FocusNode();
    address = FocusNode();
    responsable = FocusNode();
    contact = FocusNode();
    routeur = FocusNode();
    antenne = FocusNode();
    coaxial = FocusNode();
    idu = FocusNode();
    radio = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    societe.dispose();
    address.dispose();
    responsable.dispose();
    contact.dispose();
    routeur.dispose();
    idu.dispose();
    coaxial.dispose();
    radio.dispose();
    antenne.dispose();
    super.onClose();
  }
}
