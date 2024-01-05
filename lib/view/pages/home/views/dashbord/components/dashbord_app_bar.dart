// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/model/entreprise/profile_and_contact/profile_user.dart';
import 'package:telecom/utils/converter/base64_encode.dart';
import 'package:telecom/view/pages/home/views/dashbord/controller/dashbord_controller.dart';
import 'package:telecom/view/routes/route_name.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      Profile? user = controller.user;
      return SliverAppBar(
        elevation: 0,
        title: const Text("Dashborad"),
        pinned: false,
        floating: true,
        stretch: true,
        centerTitle: false,
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
            icon: user == null
                ? Container()
                : (user.image == null
                    ? const Icon(Icons.person)
                    : Image.memory(ImageConvert.decode(user.image)!)),
          ),
        ],
      );
    });
  }
}
