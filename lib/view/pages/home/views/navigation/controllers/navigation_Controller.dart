// ignore_for_file: file_names, avoid_print

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

  removeSiteFromList(Site site) {
    allSite.remove(site);
    update();
  }

  @override
  void onInit() {
    print("========= call navigation controller onInit=======");
    fetchAllSite();
    fieldLatitude = TextEditingController();
    fieldLongitude = TextEditingController();
    super.onInit();
  }

  void fetchAllSite() async {
    try {
      List<Site> response = await repository.queryall();
      response.map((e) => allSite.add(e)).toList();
      update();
    } catch (e) {
      allSite = [];
      update();
    }
  }

  // pour naviguer suite une coordonnee longitude et latitude
  void navigateTosite() async {
    if (form.currentState!.validate()) {
      try {
        final Uri url = Uri.parse(
          "https://www.google.com/maps?q=${fieldLatitude.text},${fieldLongitude.text}",
        );
        if (!await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        )) {
          throw 'Could not launch $url';
        }
      } catch (e) {
        print("======= error from urlauncher $e =========");
      }
    }
  }

  makeCallMaintenancier(String phone) async {
    try {
      final Uri appel = Uri(scheme: 'tel', path: phone);
      await launchUrl(appel);
    } catch (e) {
      print("======== error from call maintenancier $e======");
    }
  }

  @override
  void onClose() {
    fieldLatitude.dispose();
    fieldLongitude.dispose();
    print("P====== onclose controller navigation ==============");
    super.onClose();
  }
}
