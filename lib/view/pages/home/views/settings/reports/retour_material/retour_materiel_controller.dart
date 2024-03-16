// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';

import 'package:telecom/view/pages/home/views/settings/controller/setting_controller.dart';

class RetourMaterielController extends GetxController {
  final SettingController setting;
  RetourMaterielController({
    required this.setting,
  });

  late TextEditingController fieldNomSite;
  late DateTime dateDemontage;
  late FocusNode focusSite;
  GlobalKey<FormState> formkeySite = GlobalKey();
  Operator? operator;
  Project? project;
  List<String> materiels = [];

  List<String> choixMateriel = [
    "Antenne 0.3m 38GHZ monopolar",
    "Antenne 0.3m 38GHZ avec OMT",
    "Antenne 0.3m 23GHZ monopolar",
    "Antenne 0.3m 23GHZ avec OMT",
    "Antenne 0.6m 23GHZ avec OMT",
    "Antenne 0.6m 23GHZ monopolar",
    "Antenne 1m 23GHZ monopolar",
    "Antenne 1m 23GHZ avec OMT",
    "Antenne 1.2m 23GHZ monopolar",
    "Antenne 1.2m 23GHZ avec OMT",
    "Antenne 1.2m 18GHZ avec OMT",
    "Antenne 1.2m 18GHZ monopolar ",
    "Antenne 1.2m 11GHZ monopolar",
    "Antenne 1.2m 11GHZ avec OMT",
    "Antenne 2.4m 11GHZ monopolar",
    "Antenne 2.4m 11GHZ dual Polar",
    "NEO Standard 1+0",
    "DXC ",
    "NEO Standard HP",
    "Ipaso Link 200",
    "Ipaso Link 400 1+0",
    "Ipaso Link 400 2+0",
    "Ipaso Link 400 3+0",
    "Ipaso Link 400 4+0",
    "Ipaso Link VR2 1+0",
    "Ipaso Link VR2 2+0",
    "Ipaso Link VR4 ",
    "Ipaso Link VR10",
    "Ipaso Link EX/A",
    "Cable Coaxial",
    "cable LAN 1m",
    "cable LAN 3m",
    "cable LAN 5m",
    "Fibre LC-LC 1m",
    "Fibre LC-LC 3m",
    "Fibre LC-LC 5m",
    "Fibre LC-LC 10m",
  ];

  void updateOperator(Operator? value) {
    operator = value;
    update();
  }

  void updateProject(Project? value) {
    project = value;
    update();
  }

  @override
  void onInit() {
    fieldNomSite = TextEditingController();
    focusSite = FocusNode();
    dateDemontage = DateTime.now();
    super.onInit();
  }
}
