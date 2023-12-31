// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/report/pv_desinstall.dart';

class PvDemontageController extends GetxController {
// injection of Service class :

// generate constructor

// declaration of variables

// methodes and implementations

  Future<void> generatePvReception() async {
    try {
      final file = await PvDesInstall.generatePdf(
          technicien: "Amine Mejri",
          contact: "54 948 198",
          b2b: "cometel",
          address: "cite jardin de carthage",
          responsable: "Mokhtar Abidi",
          contactClient: "20350350",
          materiels: []);
      await OpenFile.open(file.path);
    } catch (e) {
      print("erreur : impossible de generer le PDF ");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
