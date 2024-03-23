import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/report/qa.dart';
import 'package:telecom/helpers/utils/formater/image_picker.dart';

class QaController extends GetxController {
  late TextEditingController nomSiteField;
  late FocusNode nomSite;
  GlobalKey<FormState> formvalidation = GlobalKey();

  Uint8List? cleanUp;
  Uint8List? antennePosition;
  Uint8List? etiquetageAntenneIf;
  Uint8List? oduFile;
  Uint8List? braconAntenne;
  Uint8List? etiquetageCoax;
  Uint8List? graisseSupportAntenne;
  Uint8List? iduDansRack;
  Uint8List? energie;
  Uint8List? etiquetageIdu;
  Uint8List? etiquetageFo;
  Uint8List? etiquetageIduGenerale;
  Uint8List? etiquetageTerre;

  Future<void> picFileFromImageCleanUp() async {
    final file = await ImagePickerFile.getImageFromGalery();
    cleanUp = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageAntennPosition() async {
    final file = await ImagePickerFile.getImageFromGalery();
    antennePosition = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageetiquetageAntenneIf() async {
    final file = await ImagePickerFile.getImageFromGalery();
    etiquetageAntenneIf = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageoduFile() async {
    final file = await ImagePickerFile.getImageFromGalery();
    oduFile = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImagebraconAntenne() async {
    final file = await ImagePickerFile.getImageFromGalery();
    braconAntenne = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageetiquetageCoax() async {
    final file = await ImagePickerFile.getImageFromGalery();
    etiquetageCoax = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImagegraisseSupportAntenne() async {
    final file = await ImagePickerFile.getImageFromGalery();
    graisseSupportAntenne = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageiduDansRack() async {
    final file = await ImagePickerFile.getImageFromGalery();
    iduDansRack = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageenergie() async {
    final file = await ImagePickerFile.getImageFromGalery();
    energie = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageetiquetageIdu() async {
    final file = await ImagePickerFile.getImageFromGalery();
    etiquetageIdu = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageetiquetageFo() async {
    final file = await ImagePickerFile.getImageFromGalery();
    etiquetageFo = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageetiquetageIduGenerale() async {
    final file = await ImagePickerFile.getImageFromGalery();
    etiquetageIduGenerale = file?.readAsBytesSync();
    update();
  }

  Future<void> picFileFromImageetiquetageTerre() async {
    final file = await ImagePickerFile.getImageFromGalery();
    etiquetageTerre = file?.readAsBytesSync();
    update();
  }

  Future<void> generateQaRapport() async {
    if (formvalidation.currentState!.validate()) {
      final file = await QaReport.generatePdf(
        site: nomSiteField.text.toUpperCase(),
        cleanUp: cleanUp,
        antennePosition: antennePosition,
        etiquetageAntenneIf: etiquetageAntenneIf,
        oduFile: oduFile,
        braconAntenne: braconAntenne,
        etiquetageCoax: etiquetageCoax,
        graisseSupportAntenne: graisseSupportAntenne,
        iduDansRack: iduDansRack,
        energie: energie,
        etiquetageIdu: etiquetageIdu,
        etiquetageFo: etiquetageFo,
        etiquetageIduGenerale: etiquetageIduGenerale,
        etiquetageTerre: etiquetageTerre,
        nom_pdf: "rapport-qualite-${nomSiteField.text.toUpperCase()}",
      );
      await OpenFile.open(file.path);
    }
  }

  @override
  void onInit() {
    nomSiteField = TextEditingController();
    nomSite = FocusNode();
    super.onInit();
  }
}
