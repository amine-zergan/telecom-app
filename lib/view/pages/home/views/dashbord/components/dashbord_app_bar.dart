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
        backgroundColor: Colors.grey.shade100,
        title: const Text("Dashborad"),
        pinned: false,
        floating: true,
        stretch: true,
        centerTitle: false,
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(
                RouteName.notification,
              );
            },
            child: const Icon(
              Icons.notification_important_outlined,
            ),
          ),
          InkWell(
            child: user == null
                ? Container()
                : (user.image == null
                    ? const Icon(Icons.person)
                    : Container(
                        padding: const EdgeInsets.all(1),
                        margin: const EdgeInsets.only(right: 10, left: 5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.memory(
                            ImageConvert.decode(user.image)!,
                            width: 30,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      )),
          ),
        ],
      );
    });
  }
}
