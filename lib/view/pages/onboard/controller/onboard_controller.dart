import 'package:get/get.dart';

class OnBoardController extends GetxController {
  /// Add index params to able update PageView.builder :
  /// variable : selectedIndex [int]
  ///

  int selectedIndex = 0;

  /// Func of Type [void] will update the widget PageView and
  /// update the selectedIndex variable
  void onChangePage(int index) {
    selectedIndex = index;
    update();
  }
}
