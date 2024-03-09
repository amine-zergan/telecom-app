// ignore_for_file: unnecessary_overrides, avoid_print, unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/rfi_model.dart';

import '../../../../../../../report/rfi_excel.dart';

enum Site { nodal, agg, ter }

class SurveySiteController extends GetxController {
  /// ------------ declaration variables ---------///
  ///
  ///
  final ImagePicker picker;

  SurveySiteController(this.picker);
  Site selectedsite = Site.nodal;
  double pylone = 0.45;
  late TextEditingController fieldSiteNom;
  late TextEditingController fieldSupportAntenne;
  late TextEditingController fieldDetail;
  late FocusNode focusSite;
  bool supportAntenne = false;
  bool barretteTerre = false;
  bool tremie = false;
  bool cheminV = false;
  bool cheminH = false;
  bool bts = false;
  bool cheminCable = false;
  bool rackEspace = false;
  bool courantAc = false;
  bool courantDc = false;
  bool vertJaune = false;
  bool clim = false;

  List<File> outdoorImage = [];
  List<File> indoorImage = [];

  ///******** create Excel Report**********///
  ///
  Future<void> generateRfiReport() async {
    final model = RFIModel(
      site: fieldSiteNom.text,
      supervior: "Amine mejri",
      operator: "orange",
      type: selectedsite,
      pylone: pylone,
      support: fieldSupportAntenne.text,
      details: fieldDetail.text,
      imageOutdoor: outdoorImage,
      imageIndoor: indoorImage,
      barrette: barretteTerre,
      bracon: supportAntenne,
      cheminCable: cheminCable,
      cheminH: cheminH,
      cheminV: cheminV,
      gND: vertJaune,
      clim: clim,
      courantAc: courantAc,
      courantDc: courantDc,
      bts: bts,
      tremie: tremie,
    );
    final file = await SurveyRfiExcel.createExcel(model);
    await OpenFile.open(file.path);
  }

  Future<void> getListImageFromGallerieindoorImage() async {
    final List<XFile> images = await picker.pickMultiImage();
    images
        .map(
          (e) => indoorImage.add(
            File.fromUri(Uri.file(e.path)),
          ),
        )
        .toList();
    update();
    print("les images telecharges sont ${indoorImage.length}");
  }

  Future<void> getListImageFromGallerieoutdoorImage() async {
    final List<XFile> images = await picker.pickMultiImage();
    images
        .map(
          (e) => outdoorImage.add(
            File.fromUri(Uri.file(e.path)),
          ),
        )
        .toList();
    update();
    print("les images telecharges outdoorImage sont ${outdoorImage.length}");
  }

  void updateSite(Site site) {
    selectedsite = site;
    update();
  }

  void updateSupportAntenne(bool? value) {
    supportAntenne = value!;
    update();
  }

  void updateBaretteTerre(bool? value) {
    barretteTerre = value!;
    update();
  }

  void updateTremie(bool? value) {
    tremie = value!;
    update();
  }

  void updateCheminV(bool? value) {
    cheminV = value!;
    update();
  }

  void updateCheminH(bool? value) {
    cheminH = value!;
    update();
  }

  void updateBts(bool? value) {
    bts = value!;
    update();
  }

  void updateCheminCable(bool? value) {
    cheminCable = value!;
    update();
  }

  void updateClim(bool? value) {
    clim = value!;
    update();
  }

  void updateGND(bool? value) {
    vertJaune = value!;
    update();
  }

  void updateCourantAc(bool? value) {
    courantAc = value!;
    update();
  }

  void updateCourantDc(bool? value) {
    courantDc = value!;
    update();
  }

  void updateRackEsp(bool? value) {
    rackEspace = value!;
    update();
  }

  void upddateMetragePylone(double value) {
    pylone = value;
    update();
  }

  /// -------------- initState ---------------- ///
  @override
  void onInit() {
    fieldSiteNom = TextEditingController();
    fieldDetail = TextEditingController();
    fieldSupportAntenne = TextEditingController();
    focusSite = FocusNode();
    super.onInit();
  }

  /// -------------- onDispose --------------- ///
  @override
  void onClose() {
    super.onClose();
  }
}
