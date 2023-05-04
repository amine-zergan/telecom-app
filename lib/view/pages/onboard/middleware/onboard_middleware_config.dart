// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';
import 'package:telecom/view/routes/route_name.dart';

class WelcomeMiddleware extends GetMiddleware {
  final IrepositoryConfigPageInit repos;

  WelcomeMiddleware({required this.repos, required this.priority});

  @override
  int? priority = 1;

  // ignore: body_might_complete_normally_nullable
  @override
  RouteSettings? redirect(String? route) {
    String? route = repos.fetchParamsConfig();
    if (route == "load") {
      return const RouteSettings(name: RouteName.home);
    } else if (route == "home") {
      return const RouteSettings(name: RouteName.onboard);
    } else {
      return null;
    }
  }
}
