// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/db/services/remote_data_service/load_page_init/Remote_load_config.dart';
import 'package:telecom/view/routes/route_name.dart';

class ConfigMiddleware extends GetMiddleware {
  final IrepositoryConfigPageInit repos;

  ConfigMiddleware({required this.repos, required this.priority});

  @override
  int? priority = 1;

  // ignore: body_might_complete_normally_nullable
  @override
  RouteSettings? redirect(String? route) {
    String? route = repos.fetchParamsConfig("config");
    // ignore: avoid_print
    print("============== middleware onboard $route");
    if (route == "home") {
      return const RouteSettings(name: RouteName.home);
    } else {
      return null;
    }
  }
}
