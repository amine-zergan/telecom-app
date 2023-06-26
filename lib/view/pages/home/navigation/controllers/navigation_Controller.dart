// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/model/site/site_model.dart';

class NavigagtionController extends GetxController {
  final IrepositorySiteDatasource repository;

  NavigagtionController(this.repository);

  List<Site> allSite = [];

  @override
  void onInit() {
    fetchAllSite();
    super.onInit();
  }

  void fetchAllSite() async {
    List<Site> response = await repository.queryall();
    response.map((e) => allSite.add(e)).toList();
    // ignore: avoid_print
    print("======== query of all site ============");
    update();
  }

  // pour naviguer suite une coordonnee longitude et latitude
  void navigateToSite() {}
}
