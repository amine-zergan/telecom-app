// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

import 'package:telecom/view/pages/home/views/settings/controller/setting_controller.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/rfi_model.dart';

import '../../../../../../../report/rfi_excel.dart';

enum Site { nodal, agg, ter }

class SurveySiteController extends GetxController {
  /// ------------ declaration variables ---------///
  ///
  ///
  final ImagePicker picker;

  final SettingController settingController;

  SurveySiteController(
    this.picker,
    this.settingController,
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final myListKeyOutDoor = GlobalKey<AnimatedListState>();
  final myListKeyIndoor = GlobalKey<AnimatedListState>();

  Site selectedsite = Site.nodal;
  bool loading = false;
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

  /// si loading =true => on applique function toggle , valeur loading =false;
  void toggleloeading() {
    loading != loading;
    update();
  }

  ///******** create Excel Report**********///
  ///
  Future<void> generateRfiReport() async {
    try {
      loading = true;
      final model = RFIModel(
        site: fieldSiteNom.text,
        supervior: settingController.profile?.name ?? "",
        operator: "orange",
        type: selectedsite,
        pylone: pylone * 100,
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
        rackEspace: rackEspace,
        tremie: tremie,
      );
      if (formKey.currentState!.validate()) {
        final file = await SurveyRfiExcel.createExcel(model);
        await OpenFile.open(file.path);
        print("======debug open file =======");
        loading = false;
      } else {
        Get.snackbar(
          "Notification",
          "Rapport RFI doit contenir le nom de Site",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade300,
        );
        loading = false;
      }
    } catch (e) {
      loading = false;
      print("catch erreur from methode create excel $e");
    }
    update();
  }

  void deleteoutdoorImage(int index) {
    outdoorImage.removeAt(index);
    print(
        "=============remove function image outdoor controller==============");
    update();
  }

  void deleteindoorImage(int index) {
    indoorImage.removeAt(index);
    update();
  }

  Future<void> getListImageFromGallerieindoorImage() async {
    final List<XFile> images = await picker.pickMultiImage();
    images.map((e) {
      indoorImage.add(
        File.fromUri(Uri.file(e.path)),
      );
    }).toList();

    print(
        "=============get gallerie function image outdoor controller==============");
    update();
  }

  Future<void> getListImageFromGallerieoutdoorImage() async {
    final List<XFile> images = await picker.pickMultiImage();
    print("======== index before adding==========");

    images.map((e) {
      outdoorImage.add(
        File.fromUri(Uri.file(e.path)),
      );
    }).toList();
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
