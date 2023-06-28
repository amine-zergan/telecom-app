// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:telecom/db/Remote_Data_Source/site/abstract_site_datasource.dart';
import 'package:telecom/model/site/site_model.dart';

class NavigationController extends GetxController {
  final IrepositorySiteDatasource repository;

  NavigationController({required this.repository});

  List<Site> allSite = [];

  /// filter by operator exemple 2 : dioclient (post-get put search ,)- repository : fetchallproduct /.....
  /// dbhelper -> creation database inclut tables
  /// -> abstract class all function necessite
  /// -> remote->(injection dbherlper) contient tous logique des functions herite depuis abstract
  /// -> controller(injection:repository,s)try-catch : exception , related between ui and logique
  /// -> creation de controller : injection binding
  /// selon besoin : parametre

  @override
  void onInit() {
    fetchAllSite();
    super.onInit();
  }

  void fetchAllSite() async {
    List<Site> response = await repository.queryall();
    response.map((e) => allSite.add(e)).toList();
    // ignore: avoid_print
    print("======== query of all site ============ $response");
    update();
  }

  // pour naviguer suite une coordonnee longitude et latitude
  void navigateToSite() {}
}
