// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:get/get.dart';

import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';

class DetailSiteController extends GetxController {
  final NavigationController navigationConttroller;
  DetailSiteController({
    required this.navigationConttroller,
  });

  /// a static function of type [void] with params [lat]
  /// and [long] to help user in navigation to site

  Future<void> navigateToSite(String lat, String long) async {
    print("start to navigation with google maps");
    await navigationConttroller.nvaigationSite(lat, long);
    print("finishing navigate to google maps");
  }
}
