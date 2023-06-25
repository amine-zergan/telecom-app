import 'package:get/get.dart';
import 'package:telecom/db/services/core/constants_config.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';

class OnBoardController extends GetxController {
  /// Add index params to able update PageView.builder :
  /// variable : selectedIndex [int]
  ///
  final IrepositoryConfigPageInit repository;
  OnBoardController(this.repository);
  int selectedIndex = 0;

  /// Func of Type [void] will update the widget PageView and
  /// update the selectedIndex variable
  void onChangePage(int index) {
    selectedIndex = index;
    update();
  }

  void initialLoad() async {
    await repository.saveParamsConfig(init, config);
    // ignore: avoid_print
    print("=========== initial load page saved ==============");
  }
}
