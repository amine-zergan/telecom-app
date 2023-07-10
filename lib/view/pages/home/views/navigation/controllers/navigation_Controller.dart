// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationController extends GetxController {
  final IrepositorySiteDatasource repository;

  NavigationController({required this.repository});
  late TextEditingController fieldLongitude;
  late TextEditingController fieldLatitude;
  GlobalKey<FormState> form = GlobalKey<FormState>();

  List<Site> allSite = [];

  @override
  void onInit() {
    fetchAllSite();
    fieldLatitude = TextEditingController();
    fieldLongitude = TextEditingController();
    super.onInit();
  }

  void fetchAllSite() async {
    try {
      List<Site> response = await repository.queryall();
      response.map((e) => allSite.add(e)).toList();
      // ignore: avoid_print

      update();
    } catch (e) {
      allSite = [];
      update();
    }
  }

  // pour naviguer suite une coordonnee longitude et latitude
  void navigateTosite() async {
    if (form.currentState!.validate()) {
      final Uri url = Uri.parse(
        "https://www.google.com/maps?q=${fieldLatitude.text},${fieldLongitude.text}",
      );
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  void onClose() {
    fieldLatitude.dispose();
    fieldLongitude.dispose();
    super.onClose();
  }
}
