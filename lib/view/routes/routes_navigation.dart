import 'package:get/get.dart';
import 'package:telecom/view/routes/route_name.dart';

import '../pages/onboard/page/onboard_page.dart';

class Routes {
  Routes._();
  static List<GetPage> routes = [
    GetPage(
      name: RouteName.load,
      page: () => const OnboardPage(),
    ),
  ];
}
