import 'package:get/get.dart';
import 'package:telecom/view/pages/config/config_page.dart';
import 'package:telecom/view/pages/config/controller/config_binding.dart';
import 'package:telecom/view/pages/home/home_page.dart';
import 'package:telecom/view/pages/onboard/controller/onboard_bind.dart';
import 'package:telecom/view/routes/route_name.dart';

import '../pages/onboard/page/onboard_page.dart';

class Routes {
  Routes._();
  static List<GetPage> routes = [
    GetPage(
      name: RouteName.onboard,
      page: () => const OnboardPage(),
      binding: OnboardBind(),
    ),
    GetPage(
      name: RouteName.config,
      page: () => const ConfigPage(),
      binding: ConfigBind(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const MyHomePage(),
    )
  ];
}
