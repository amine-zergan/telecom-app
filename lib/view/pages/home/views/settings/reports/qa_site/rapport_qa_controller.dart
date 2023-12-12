import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QaController extends GetxController {
  late TextEditingController nomSiteField;
  late FocusNode nomSite;

  @override
  void onInit() {
    nomSiteField = TextEditingController();
    nomSite = FocusNode();
    super.onInit();
  }
}
