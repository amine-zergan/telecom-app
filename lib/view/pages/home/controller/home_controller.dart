// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class HomeController extends GetxController {
  /// contain 4 pages params and logic
  /// dashboard - navigation-setting-contact-mission
  ///
  int current_index = 0;

  updateIndex(int index) {
    current_index = index;
    update();
  }
}
