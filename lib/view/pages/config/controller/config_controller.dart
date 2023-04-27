import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigController extends GetxController {
  /// declare variable of pageController
  /// update methodes with getter;
  late PageController _controller;
  PageController get pageController => _controller;
  int _page = 0;
  int get currentPage => _page;

  /// Func of Type [void] for updating current Page
  ///
  void updateCurrentPage(int index) {
    _page = index;
    update();
  }

  /// Func of Type [void] for navigate to next Page with methode animateToPage
  ///
  /// with params duration [500s] and curve [linear]
  ///
  /// and update value of progress Bar
  void navigatePageController() {
    if (_page <= 5) {
      _controller.animateToPage(
        _page + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      value = value + 0.16;
    } else {
      value = 1.0;
    }
    update();
  }

  bool getLastPage() {
    return _page == 6;
  }

  /// progress bar value depend on fields page ...
  double value = 0.0;

  @override
  void onInit() {
    _controller = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
