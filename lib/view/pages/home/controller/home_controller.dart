// ignore_for_file: non_constant_identifier_names

import 'package:flutter_native_splash/flutter_native_splash.dart';
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

  @override
  void onInit() {
    FlutterNativeSplash.remove();
    super.onInit();
  }
}
