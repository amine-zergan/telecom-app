// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationController extends GetxController {
  final IrepositorySiteDatasource repository;

  NavigationController({required this.repository});

  List<Site> allSite = [];

  @override
  void onInit() {
    fetchAllSite();
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
  void navigateTosite(String lat, String long) async {
    final Uri url = Uri.parse(
      "https://www.google.com/maps?q=$lat,$long",
    );
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
