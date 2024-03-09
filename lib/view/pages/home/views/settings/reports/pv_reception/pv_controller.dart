// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/report/pv_install.dart';
import 'package:telecom/view/pages/home/views/settings/controller/setting_controller.dart';

class PvReceptionController extends GetxController {
  PvReceptionController(this.settingController);

  final SettingController settingController;
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
        technicien: settingController.profile?.name ?? "",
        contact: settingController.profile?.phone ?? "",
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

  @override
  void onInit() {
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
