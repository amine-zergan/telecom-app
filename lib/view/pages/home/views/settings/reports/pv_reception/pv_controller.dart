// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/db/Remote_Data_Source/profile/abstract_profile_datasource.dart';

import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/report/pv_install.dart';

class PvReceptionController extends GetxController {
  PvReceptionController(
    this.reposProfile,
  );
  final IrepositroyProfileDataSource reposProfile;

  late TextEditingController societeField;
  late TextEditingController addressField;
  late TextEditingController responsableField;
  late TextEditingController contactField;
  late TextEditingController debitField;

  late FocusNode societe;
  late FocusNode address;
  late FocusNode responsable;
  late FocusNode contact;
  late FocusNode debit;

  GlobalKey<FormState> formvalidation = GlobalKey();

  Profile? user;

  String? validateEntreprise(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de saisi le nom de client";
    } else if (value.length < 4) {
      return "nom invalide";
    } else {
      return null;
    }
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de saisi l'address";
    } else if (value.length < 4) {
      return "address invalide";
    } else {
      return null;
    }
  }

  String? validateResponsable(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de saisi le nom de responsable";
    } else if (value.length < 4) {
      return "nom invalide";
    } else {
      return null;
    }
  }

  String? validateDebit(String? value) {
    if (value == null || value.isEmpty) {
      return "merci de mettre le debit";
    } else if (double.parse(value) < 10 || double.parse(value) > 1000) {
      return "Debit invalide";
    } else {
      return null;
    }
  }

  Future<void> generatePvReception() async {
    try {
      final file = await PvInstall.generatePdf(
        technicien: user?.name ?? "",
        contact: user?.contract ?? "",
        b2b: societeField.text,
        address: addressField.text,
        responsable: responsableField.text,
        contactClient: contactField.text,
        debit: double.parse(
          debitField.text,
        ),
      );
      await OpenFile.open(file.path);
    } catch (e) {
      print("erreur : impossible de generer le PDF ");
    }
  }

  void getUser() async {
    final response = await reposProfile.fetch();
    user = response;
    print("user fetched with success $user ");
    update();
  }

  @override
  void onInit() {
    getUser();
    societeField = TextEditingController();
    addressField = TextEditingController();
    responsableField = TextEditingController();
    contactField = TextEditingController();
    debitField = TextEditingController();
    societe = FocusNode();
    address = FocusNode();
    responsable = FocusNode();
    contact = FocusNode();
    debit = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    societe.dispose();
    contact.dispose();
    address.dispose();
    debit.dispose();
    responsable.dispose();
    super.onClose();
  }
}
