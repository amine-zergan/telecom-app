// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/routes/route_name.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      title: const Text("Dashborad"),
      pinned: false,
      floating: true,
      stretch: true,
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(
              RouteName.notification,
            );
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.notification_important_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.toNamed(
              RouteName.history,
            );
          },
          splashRadius: 20,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.manage_history_outlined,
          ),
        ),
      ],
    );
  }
}
