// ignore_for_file: file_names, avoid_print, unnecessary_brace_in_string_interps

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationController extends GetxController {
  final IrepositorySiteDatasource _repository;

  NavigationController({required IrepositorySiteDatasource repository})
      : _repository = repository {
    print("=========  creation d'instance irepos==========");
  }
  late TextEditingController fieldLongitude;
  late TextEditingController fieldLatitude;
  late StreamSubscription<Site> streamSubscription;
  StreamController<Site> streamController = StreamController<Site>.broadcast();
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
    streamSubscription = streamController.stream.listen((event) {});
    fieldLatitude = TextEditingController();
    fieldLongitude = TextEditingController();

    super.onInit();
  }

  void addSiteTolist(Site value) {
    allSite.add(value);
    update();
  }

  void fetchAllSite() async {
    try {
      List<Site> response = await _repository.queryall();
      response.map((e) => allSite.add(e)).toList();
      update();
    } catch (e) {
      allSite = [];
      update();
    }
  }

  // pour naviguer suite une coordonnee longitude et latitude
  Future<void> navigateTosite(String lat, String long) async {
    if (form.currentState!.validate()) {
      navigateTosite(lat, long);
    } else {
      Get.snackbar("notification", "merci de verifier les coordonnées saisis",
          backgroundColor: Colors.red.shade300);
    }
  }

  Future<void> nvaigationSite(String lat, String long) async {
    try {
      final Uri url = Uri.parse(
        "https://www.google.com/maps?q=${lat},${long}",
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

  Future<void> makeCallMaintenancier(String phone) async {
    try {
      final Uri appel = Uri(scheme: 'tel', path: phone);
      await launchUrl(appel);
      print("start making call");
    } catch (e) {
      print("======== error from call maintenancier $e======");
    }
  }

  @override
  void onClose() {
    fieldLatitude.dispose();
    fieldLongitude.dispose();
    streamSubscription.cancel();
    print("P====== onclose controller navigation ==============");
    super.onClose();
  }
}
