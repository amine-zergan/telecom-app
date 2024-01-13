// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/site_type.dart';

enum Site { nodal, agg, ter }

class SurveySiteController extends GetxController {
  /// ------------ declaration variables ---------///
  SiteType site = SiteType.nodal;
  late TextEditingController fieldSiteNom;
  late TextEditingController fieldmetragePylone;
  late TextEditingController fieldSupportAntenne;

  /// -------------- initState ---------------- ///
  @override
  void onInit() {
    fieldSiteNom = TextEditingController();
    fieldmetragePylone = TextEditingController();
    fieldSupportAntenne = TextEditingController();
    super.onInit();
  }

  /// -------------- onDispose --------------- ///
  @override
  void onClose() {
    super.onClose();
  }
}
